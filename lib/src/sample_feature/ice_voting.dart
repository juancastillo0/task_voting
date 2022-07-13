import 'package:task_voting/src/fields/prelude.dart';

import 'package:task_voting/src/sample_feature/sample_item.dart';

class ICEVotingTable extends StatelessObserverWidget {
  const ICEVotingTable({
    Key? key,
    required this.items,
    required this.sortCallback,
    required this.sortIndex,
  }) : super(key: key);

  final List<ItemICEAssessment> items;
  final int? sortIndex;
  final void Function(int index, bool ascending) sortCallback;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      border: TableBorder.all(
        borderRadius: BorderRadius.circular(3),
      ),
      horizontalMargin: 6,
      columnSpacing: 12,
      headingRowHeight: 32,
      dataRowHeight: 44,
      sortAscending: sortIndex == null || sortIndex! > 0,
      sortColumnIndex: sortIndex?.abs(),
      columns: [
        const DataColumn(
          label: Text('Title'),
        ),
        DataColumn(
          numeric: true,
          label: const Text('Impact'),
          onSort: sortCallback,
        ),
        DataColumn(
          numeric: true,
          label: const Text('Confidence'),
          onSort: sortCallback,
        ),
        DataColumn(
          numeric: true,
          label: const Text('Easiness'),
          onSort: sortCallback,
        ),
        DataColumn(
          numeric: true,
          label: const Text('Urgency'),
          onSort: sortCallback,
        ),
        DataColumn(
          numeric: true,
          label: const Text('Points'),
          onSort: sortCallback,
        ),
      ],
      rows: items
          .map(
            (e) => DataRow(
              key: ValueKey(e.info.id),
              cells: [
                DataCell(
                  Text(e.info.title.value),
                ),
                DataCell(
                  IntInput(obs: e.impact),
                ),
                DataCell(
                  IntInput(obs: e.confidence),
                ),
                DataCell(
                  IntInput(obs: e.easiness),
                ),
                DataCell(
                  IntInput(obs: e.urgency),
                ),
                DataCell(
                  Observer(builder: (context) {
                    return Text(e.points.value.toString());
                  }),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
