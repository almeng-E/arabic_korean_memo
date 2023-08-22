import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:flutter/material.dart';

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
    return Expanded(
      child: ListView.separated(
        itemCount: data.length,
        itemBuilder: (context, index) {
          print(index);
          return _BuildVocabList(data[index]);
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
    return ExpansionTile(
      backgroundColor: hermesOrange,
      textColor: Colors.black,
      iconColor: Colors.black,
      collapsedBackgroundColor: hermesOrange,
      collapsedTextColor: Colors.black,
      collapsedIconColor: Colors.black,
      tilePadding: const EdgeInsets.all(2),
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
