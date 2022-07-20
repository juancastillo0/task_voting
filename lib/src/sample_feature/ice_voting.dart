import 'package:task_voting/src/fields/prelude.dart';
import 'package:task_voting/src/sample_feature/choices_view.dart';
import 'package:task_voting/src/sample_feature/sample_item.dart';

class ICEVotingTable extends StatelessObserverWidget {
  const ICEVotingTable({
    Key? key,
    required this.items,
    required this.sortCallback,
    required this.sortIndex,
  }) : super(key: key);

  final List<SampleItemEditable> items;
  final int? sortIndex;
  final void Function(int index, bool ascending) sortCallback;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ChoicesStore>(context);
    final loc = AppLocalizations.of(context)!;

    DataCell sumValue(
      int Function(ItemICEAssessment item) reducer, {
      bool showError = true,
    }) {
      return DataCell(
        Observer(builder: (context) {
          final value =
              items.map((e) => e.iceAssessment).map(reducer).fold<int>(
                    0,
                    (previousValue, element) => previousValue + element,
                  );

          return SelectableText(
            value.toString(),
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: showError && value > store.iceMaxValuePerVote.value
                      ? Colors.red[900]
                      : null,
                ),
          );
        }),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              padding: const EdgeInsets.all(6.0),
              child: ObsTextInput(
                obs: store.iceMaxValuePerVote,
                parser: TextInputParser.intParser,
                textField: const TextField(
                  decoration: InputDecoration(label: Text('Max Sum')),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  // boxShadow: kElevationToShadow[1],
                  borderRadius: BorderRadius.circular(4),
                ),
                border: TableBorder.all(
                  borderRadius: BorderRadius.circular(4),
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
                ),
                horizontalMargin: 6,
                columnSpacing: 12,
                headingRowHeight: 32,
                dataRowHeight: 44,
                sortAscending: sortIndex == null || sortIndex! > 0,
                sortColumnIndex: sortIndex?.abs(),
                columns: [
                  DataColumn(
                    label: SelectableText(loc.iceTableChoiceTitle),
                  ),
                  DataColumn(
                    numeric: true,
                    label: Text(loc.iceTableImpact),
                    onSort: sortCallback,
                  ),
                  DataColumn(
                    numeric: true,
                    label: Text(loc.iceTableConfidence),
                    onSort: sortCallback,
                  ),
                  DataColumn(
                    numeric: true,
                    label: Text(loc.iceTableEasiness),
                    onSort: sortCallback,
                  ),
                  DataColumn(
                    numeric: true,
                    label: Text(loc.iceTableUrgency),
                    onSort: sortCallback,
                  ),
                  DataColumn(
                    numeric: true,
                    label: Text(loc.iceTablePoints),
                    onSort: sortCallback,
                  ),
                ],
                rows: items.map(
                  (item) {
                    final e = item.iceAssessment;
                    return DataRow(
                      key: ValueKey(item.id),
                      cells: [
                        DataCell(
                          Row(
                            children: [
                              Expanded(
                                child: SelectableText(item.title.value),
                              ),
                              RoundedIconButton(
                                onTap: () {
                                  showSimpleAlertDialog(
                                    context,
                                    ChoiceInfo(choice: item),
                                  );
                                },
                                size: 20,
                                icon: Icons.info_outline,
                              )
                            ],
                          ),
                        ),
                        DataCell(
                          ObsTextInput(
                            obs: e.impact,
                            parser: TextInputParser.intParser,
                            textField: const TextField(
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        DataCell(
                          ObsTextInput(
                            obs: e.confidence,
                            parser: TextInputParser.intParser,
                            textField: const TextField(
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        DataCell(
                          ObsTextInput(
                            obs: e.easiness,
                            parser: TextInputParser.intParser,
                            textField: const TextField(
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        DataCell(
                          ObsTextInput(
                            obs: e.urgency,
                            parser: TextInputParser.intParser,
                            textField: const TextField(
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        DataCell(
                          Observer(builder: (context) {
                            return SelectableText(e.points.value.toString());
                          }),
                        ),
                      ],
                    );
                  },
                ).toList()
                  ..add(DataRow(
                    key: const ValueKey('sumFooter'),
                    cells: [
                      DataCell(
                        Text(loc.iceTableSumFooter),
                      ),
                      sumValue((e) => e.impact.value),
                      sumValue((e) => e.confidence.value),
                      sumValue((e) => e.easiness.value),
                      sumValue((e) => e.urgency.value),
                      sumValue((e) => e.points.value, showError: false),
                    ],
                  )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
