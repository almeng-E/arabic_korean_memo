import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class WordCards extends StatefulWidget {
  const WordCards({super.key});

  @override
  State<WordCards> createState() => _WordCardsState();
}

class _WordCardsState extends State<WordCards> {
  // 사용될 아이템 리스트 _data 생성
  List<Item> _data = [];

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
      // dividerColor: Colors.amber, 색깔 구분선
      expandedHeaderPadding: EdgeInsets.zero,
      children: _data.map<ExpansionPanelRadio>((Item item) {
        return ExpansionPanelRadio(
          // 임시 컬러
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

// Item 이라는 클래스 선언
class Item {
  Item({
    required this.wordId,
    required this.arabicWord,
    required this.koreanMeaning,
    required this.page,
    required this.grammaticalType,
    required this.isMemorized,
    required this.root,
    required this.info,
  });
  int wordId, page;
  String arabicWord, koreanMeaning, grammaticalType, root, info, isMemorized;
}

// Item을 요소로 가지는 List 생성(genereate)
List<Item> generateItemsFromCsv(List<Map<String, dynamic>> csvData) {
  return csvData.map((data) {
    return Item(
      wordId: data['word_id'],
      arabicWord: data['arabic_word'],
      koreanMeaning: data['korean_meaning'],
      page: data['page'],
      grammaticalType: data['grammatical_type'],
      isMemorized: data['is_memorized'], // Assuming 'A' indicates memorized
      root: data['root'],
      info: data['info'],
    );
  }).toList();
}

Future<List<Item>> parseCsvAndGenerateItems(String csvContent) async {
  List<List<dynamic>> csvRows = const CsvToListConverter().convert(csvContent);
  List<Map<String, dynamic>> csvData = [];

  for (var row in csvRows.skip(1)) {
    csvData.add({
      'word_id': row[0],
      'arabic_word': row[1],
      'korean_meaning': row[2],
      'page': row[3],
      'grammatical_type': row[4],
      'is_memorized': row[5],
      'root': row[6],
      'info': row[7],
    });
  }

  return csvData.map((data) {
    return Item(
      wordId: data['word_id'],
      arabicWord: data['arabic_word'],
      koreanMeaning: data['korean_meaning'],
      page: data['page'],
      grammaticalType: data['grammatical_type'],
      isMemorized: data['is_memorized'],
      root: data['root'],
      info: data['info'],
    );
  }).toList();
}
