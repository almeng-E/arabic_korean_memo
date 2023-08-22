import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';

// =========================================================================
// make Item class
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

// csv to <List<Item>>
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

// SINGLETON DATA MANAGER 객체
class ItemDataManager {
  static final ItemDataManager _instance = ItemDataManager._internal();

  factory ItemDataManager() {
    return _instance;
  }

  ItemDataManager._internal();

  List<Item> _originalItems = [];

// 나중에 modify 하기 : 여러 csvFilePath 받을 경우
  Future<void> loadData() async {
    if (_originalItems.isEmpty) {
      String csvContent = await rootBundle.loadString('assets/csv/DUMMY.csv');
      _originalItems = await parseCsvAndGenerateItems(csvContent);
    }
  }

  List<Item> getShuffledItems() {
    List<Item> shuffledItems = List.from(_originalItems);
    shuffledItems.shuffle();
    return shuffledItems;
  }

  List<Item> get items => _originalItems;
}
