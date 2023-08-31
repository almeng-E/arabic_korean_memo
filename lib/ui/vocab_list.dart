import 'package:flutter/material.dart';

import 'package:arabic_korean_memo/data/item_class.dart';

// =========================================================================

class VocabList extends StatelessWidget {
  final List<Item> items;

  const VocabList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _BuildVocabList(items[index]);
        },
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 2,
          );
        },
      ),
    );
  }
}

class _BuildVocabList extends StatelessWidget {
  final Item item;
  const _BuildVocabList(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 1),
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ExpansionTile(
        title: ListTile(
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
        ),
        children: [
          Container(
            color: Colors.white.withOpacity(0.1),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
        ],
      ),
    );
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
}
