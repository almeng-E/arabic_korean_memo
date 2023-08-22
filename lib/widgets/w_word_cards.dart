import 'package:flutter/material.dart';

import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:arabic_korean_memo/widgets/d_data_manager.dart';

// =========================================================================
class WordCards extends StatefulWidget {
  const WordCards({super.key});

  @override
  State<WordCards> createState() => _WordCardsState();
}

class _WordCardsState extends State<WordCards> {
  List<Item> data = [];

  @override
  void initState() {
    super.initState();
    data = ItemDataManager().items;
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
      children: data.map<ExpansionPanelRadio>((Item item) {
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
              // tileColor: hermesOrange,
            );
          },
          body: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // color: hermesOrange.withOpacity(0.9),
            child: Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(100),
                1: FixedColumnWidth(1),
                2: FlexColumnWidth(),
              },
              textBaseline: TextBaseline.ideographic,
              children: <TableRow>[
                _buildTableRow('품사', item.grammaticalType),
                _buildTableRow('어근', item.root),
                _buildTableRow('추가정보', '${item.info} blah blah blah'),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

TableRow _buildTableRow(String title, String content) {
  return TableRow(
    children: <Widget>[
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Text(title),
      ),
      const SizedBox(height: 32),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Text(content),
      ),
    ],
  );
}
