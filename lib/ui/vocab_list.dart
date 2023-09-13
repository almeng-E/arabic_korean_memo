import 'package:flutter/material.dart';

import 'package:arabic_korean_memo/data/item_class.dart';

// =========================================================================

class VocabList extends StatelessWidget {
  final List<Item> items;

  const VocabList({
    Key? key,
    required this.items,
  }) : super(key: key);

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

class _BuildVocabList extends StatefulWidget {
  final Item item;

  const _BuildVocabList(this.item);

  @override
  State<_BuildVocabList> createState() => _BuildVocabListState();
}

class _BuildVocabListState extends State<_BuildVocabList> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          // swipe right
          print('swipe right');
        } else if (details.primaryVelocity! < 0) {
          //swipe left
        }
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 1),
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ExpansionTile(
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          title: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.item.arabicWord,
                  style: const TextStyle(fontSize: 20),
                ),
                Flexible(
                  child: isExpanded
                      ? Text(
                          widget.item.koreanMeaning,
                        )
                      : Text(
                          widget.item.koreanMeaning,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                ),
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
                  _buildTableRow('품사', widget.item.grammaticalType),
                  _buildTableRow('어근', widget.item.root),
                  _buildTableRow('추가정보', '${widget.item.info} blah blah blah'),
                ],
              ),
            ),
          ],
        ),
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
