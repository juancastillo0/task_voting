import 'package:intl/intl.dart';
import 'package:task_voting/src/fields/prelude.dart';
import 'package:task_voting/src/tasks/tasks_store.dart';

class TasksCalendarView extends StatelessObserverWidget {
  const TasksCalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.ref(TasksStore.ref);
    final loc = AppLocalizations.of(context)!;

    // week
    // month

    if (store.view == TaskView.sequence) {
      const minutesPerPixel = 1.0;
      const rowHeight = 50.0;

      final sortedTasks = store.sortedTasks;
      final totalMinutes = sortedTasks.fold<double>(
        0.0,
        (s, e) => s + (e.minDuration.inMinutes + e.maxDuration.inMinutes) / 2,
      );
      final totalDays = (totalMinutes / (store.hoursPerDay * 60)).ceil();
      final dayWidth = 60 * store.hoursPerDay / minutesPerPixel;

      const side = BorderSide(color: Colors.black26);
      double minutes = 0.0;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Column(
                children: [
                  SizedBox(
                    height: rowHeight,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(loc.tasksTitle),
                    ),
                  ),
                  ...sortedTasks.map(
                    (e) {
                      return SizedBox(
                        height: rowHeight,
                        child: Row(
                          children: [
                            Text(e.name),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Stack(
                  children: [
                    SizedBox(
                      height: rowHeight * (sortedTasks.length + 1),
                      child: Row(
                        children: List.generate(
                          totalDays,
                          (index) => Container(
                            width: dayWidth,
                            alignment: Alignment.topCenter,
                            decoration: index == 0
                                ? const BoxDecoration(
                                    border: Border.fromBorderSide(side),
                                  )
                                : const BoxDecoration(
                                    border: Border(
                                      right: side,
                                      bottom: side,
                                      top: side,
                                    ),
                                  ),
                            child: SizedBox(
                              height: rowHeight,
                              child: Center(child: Text('${loc.day} ${index + 1}')),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: rowHeight),
                        ...sortedTasks.map(
                          (e) {
                            // TODO: show uncertainty
                            final duration = (e.minDuration.inMinutes +
                                    e.maxDuration.inMinutes) /
                                2;
                            minutes += duration;
                            return SizedBox(
                              height: rowHeight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        (minutes - duration) / minutesPerPixel,
                                  ),
                                  Container(
                                    color: Colors.blue[200],
                                    width: duration / minutesPerPixel,
                                    height: 50,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    final date = DateTime.now();
    final weekDayFormat = DateFormat(DateFormat.ABBR_WEEKDAY, loc.localeName);
    const dayWidth = 80.0;
    final start = -(DateTime(date.year, date.month, 1).weekday - 2);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: Iterable<int>.generate(DateTime.daysPerWeek)
                // Monday, Tuesday ...
                .map(
                  (e) => Container(
                    width: dayWidth,
                    alignment: Alignment.center,
                    child: Text(weekDayFormat.format(DateTime(2022, 7, 4 + e))),
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: Column(
              children: List.generate(
                store.view == TaskView.week ? 1 : 6,
                (index) {
                  return Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        DateTime.daysPerWeek,
                        (e) {
                          // final day = date.day - (date.weekday - 1) + e;
                          final day = store.view == TaskView.week
                              ? date.day - (date.weekday - 1) + e
                              : start + e + index * 7;
                          final weekDayDate =
                              DateTime(date.year, date.month, day);
                          final tasksInDay = store.tasks.where((task) {
                            final deliveryDate = task.deliveryDate;
                            return deliveryDate != null &&
                                deliveryDate.year == weekDayDate.year &&
                                deliveryDate.month == weekDayDate.month &&
                                deliveryDate.day == weekDayDate.day;
                          });

                          return Center(
                            child: Column(
                              children: [
                                Container(
                                  width: dayWidth,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: day == date.day
                                        ? Colors.blue[200]
                                        : null,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    '${weekDayDate.day}',
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      ...tasksInDay.map(
                                        (e) => Chip(
                                          label: Text(e.name),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
