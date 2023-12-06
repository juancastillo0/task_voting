-- 
CREATE TABLE users (id INTEGER NOT NULL PRIMARY KEY, name TEXT NOT NULL);
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
    id INTEGER NOT NULL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    title TEXT NOT NULL,
    subtitle TEXT NULL,
    body TEXT NOT NULL,
    poll_kind VARCHAR(512) NULL,
    form_json_schema JSON NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- 
CREATE TABLE poll_option (
    id INTEGER NOT NULL PRIMARY KEY,
    poll_id INTEGER NOT NULL REFERENCES poll(id),
    priority INT default 0,
    description TEXT NULL,
    url TEXT NULL,
    from_json_schema JSON NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- -- 
-- CREATE TABLE form (
--     id INTEGER PRIMARY KEY,
--     json_schema JSON NOT NULL,
-- );
-- 
CREATE TABLE poll_vote (
    poll_id INTEGER NOT NULL REFERENCES poll(id),
    user_id INTEGER NOT NULL REFERENCES users(id),
    form_response JSON NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(poll_id, user_id)
);
-- 
CREATE TABLE poll_option_vote (
    poll_option_id INTEGER NOT NULL REFERENCES poll_option(id),
    user_id INTEGER NOT NULL REFERENCES users(id),
    value INTEGER NOT NULL,
    form_response JSON NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(poll_option_id, user_id)
);
-- 
SELECT users.id,
    users.name user_name,
    po.id,
    poll.*
FROM user
    INNER JOIN poll ON poll.user_id = users.id
    LEFT JOIN poll_option po ON po.poll_id = poll.id
WHERE users.id = 1
    and poll.subtitle is not null;
-- {"name":"userWithPosts"}
SELECT users.id,
    users.name user_name,
    json_group_array(
        json_object(
            'id',
            poll.id,
            'user_id',
            poll.user_id,
            'title',
            poll.title,
            'subtitle',
            poll.subtitle,
            'body',
            poll.body,
            'created_at',
            poll.created_at,
            'options',
            json_array(po.id)
        )
    ) poll
FROM user
    INNER JOIN poll ON poll.user_id = users.id
    LEFT JOIN poll_option po ON po.poll_id = poll.id
WHERE poll.subtitle is not null
GROUP BY users.id;
-- {"name":"userWithPostsJSON"}
SELECT users.id,
    users.name user_name,
    json_group_array(p.json_value) poll
FROM user
    INNER JOIN poll_with_options_json p ON p.user_id = users.id
GROUP BY users.id;
-- 
CREATE VIEW poll_with_options_json AS
SELECT poll.id,
    poll.user_id,
    json_object(
        'id',
        poll.id,
        'user_id',
        poll.user_id,
        'title',
        poll.title,
        'subtitle',
        poll.subtitle,
        'body',
        poll.body,
        'created_at',
        poll.created_at,
        'options',
        json_group_array(po.id)
    ) json_value
FROM poll
    LEFT JOIN poll_option po ON po.poll_id = poll.id
GROUP BY poll.id;
--
DELETE FROM users WHERE (id = ?) RETURNING id,name;