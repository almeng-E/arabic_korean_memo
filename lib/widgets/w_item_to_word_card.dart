import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:arabic_korean_memo/widgets/w_csv_to_item.dart';

class WordCards extends StatefulWidget {
  const WordCards({super.key});

  @override
  State<WordCards> createState() => _WordCardsState();
}

class _WordCardsState extends State<WordCards> {
  List<Item> _data = []; // List of items

  @override
  void initState() {
    super.initState();
    _loadCsvData();
  }

  Future<void> _loadCsvData() async {
    String csvContent = await rootBundle.loadString('assets/csv/DUMMY.csv');
    List<Item> items = await parseCsvAndGenerateItems(csvContent);
    setState(() {
      _data = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList.radio(
      expandedHeaderPadding: EdgeInsets.zero,
      children: _data.map<ExpansionPanelRadio>((Item item) {
        return ExpansionPanelRadio(
          backgroundColor: hermesOrange,
          canTapOnHeader: true,
          value: item.wordId,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.arabicWord,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(item.koreanMeaning),
                ],
              ),
            );
          },
          body: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // color: Colors.amber,
            child: Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(100),
                1: FixedColumnWidth(1),
                2: FlexColumnWidth(),
              },
              textBaseline: TextBaseline.ideographic,
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    const TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text('품사'),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(item.grammaticalType),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    const TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text('어근'),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(item.root),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    const TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text('추가정보'),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text('${item.info} blah blah blah'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}