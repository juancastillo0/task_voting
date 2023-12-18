-- 
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    refreshToken TEXT NOT NULL UNIQUE
);
-- 
SELECT *
FROM users;
-- 
SELECT *
FROM users
WHERE users.id >= :minId;
-- 
INSERT INTO users(id, name)
VALUES (1, 'name1'),
    (2, :c);
-- {"name":"updateUserName"}
UPDATE user
SET name = :name
WHERE :id = id
RETURNING *;
-- {"name":"deleteUsersById"}
DELETE FROM user
WHERE id IN (:ids);
-- 
CREATE TABLE poll (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    userId INTEGER NOT NULL REFERENCES users(id),
    title TEXT NOT NULL,
    subtitle TEXT NULL,
    body TEXT NOT NULL,
    pollKind VARCHAR(512) NULL,
    formJsonSchema JSON NULL,
    deletedAt TIMESTAMP NULL,
    endsAt TIMESTAMP NULL,
    voterShareToken TEXT NOT NULL,
    adminShareToken TEXT NOT NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- 
CREATE TABLE poll_users (
    userId INTEGER NOT NULL REFERENCES poll(id),
    pollId INTEGER NOT NULL REFERENCES poll(id),
    permission TEXT NOT NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(pollId, userId)
);
-- 
CREATE TABLE poll_option (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    pollId INTEGER NOT NULL REFERENCES poll(id),
    priority INT default 0,
    description TEXT NULL,
    url TEXT NULL,
    formJsonSchema JSON NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- -- 
-- CREATE TABLE form (
--     id INTEGER PRIMARY KEY,
--     json_schema JSON NOT NULL,
-- );
-- 
CREATE TABLE poll_vote (
    pollId INTEGER NOT NULL REFERENCES poll(id),
    userId INTEGER NOT NULL REFERENCES users(id),
    formResponse JSON NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(pollId, userId)
);
-- 
CREATE TABLE poll_option_vote (
    pollOptionId INTEGER NOT NULL REFERENCES poll_option(id),
    userId INTEGER NOT NULL REFERENCES users(id),
    value INTEGER NOT NULL,
    formResponse JSON NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(pollOptionId, userId)
);
-- 
SELECT users.id,
    users.name user_name,
    po.id,
    poll.*
FROM user
    INNER JOIN poll ON poll.userId = users.id
    LEFT JOIN poll_option po ON po.pollId = poll.id
WHERE users.id = 1
    and poll.subtitle is not null;
-- {"name":"userWithPosts"}
SELECT users.id,
    users.name user_name,
    json_group_array(
        json_object(
            'id',
            poll.id,
            'userId',
            poll.userId,
            'title',
            poll.title,
            'subtitle',
            poll.subtitle,
            'body',
            poll.body,
            'createdAt',
            poll.createdAt,
            'options',
            json_array(po.id)
        )
    ) poll
FROM user
    INNER JOIN poll ON poll.userId = users.id
    LEFT JOIN poll_option po ON po.pollId = poll.id
WHERE poll.subtitle is not null
GROUP BY users.id;
-- {"name":"userWithPostsJSON"}
SELECT users.id,
    users.name userName,
    json_group_array(p.jsonValue) poll
FROM user
    INNER JOIN poll_with_options_json p ON p.userId = users.id
GROUP BY users.id;
-- 
CREATE VIEW poll_with_options_json AS
SELECT poll.id,
    poll.userId,
    json_object(
        'id',
        poll.id,
        'userId',
        poll.userId,
        'title',
        poll.title,
        'subtitle',
        poll.subtitle,
        'body',
        poll.body,
        'createdAt',
        poll.createdAt,
        'options',
        json_group_array(po.id)
    ) jsonValue
FROM poll
    LEFT JOIN poll_option po ON po.pollId = poll.id
GROUP BY poll.id;
--
-- -- 
-- CREATE VIEW poll_with_options_json AS
-- SELECT id,
--     userId,
--     title,
--     subtitle,
--     body,
--     createdAt,
--     po.options
-- FROM poll
--     LEFT JOIN (SELECT json_group_array(
--             json_object(
--         'id', id,
--         'pollId', pollId,
--         'priority', priority,
--         'description', description,
--         'url', url,
--         'formJsonSchema', formJsonSchema,
--         'createdAt', createdAt,
--         'votes', pov.votes)
--     ) options,
--     pollId
--         from poll_option
--         LEFT JOIN (SELECT json_group_array(
--                 json_object('pollOptionId', pollOptionId,
--                             'userId', userId,
--                             'value', value,
--                             'formResponse', formResponse,
--                             'createdAt', createdAt)
--                         ) votes,
--                         pollOptionId
--             FROM poll_option_vote
--             GROUP BY pollOptionId
--         ) pov ON pov.pollOptionId = id
--         group by pollId
--     ) po ON po.pollId = poll.id;
--
DELETE FROM users WHERE (id = ?) RETURNING id,name;
-- {"name":"userWithVotes"}
SELECT *
FROM poll
inner join poll_option po on po.pollId = poll.id
inner join poll_option_vote pov on pov.pollOptionId = po.id
WHERE pov.userId = :userId;
-- {"name":"pollVotes"}
SELECT pov.*
FROM poll
inner join poll_option po on po.pollId = poll.id
inner join poll_option_vote pov on pov.pollOptionId = po.id
WHERE poll.id = :pollId;