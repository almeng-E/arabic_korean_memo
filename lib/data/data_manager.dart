import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

import 'package:arabic_korean_memo/data/item_class.dart';
// =========================================================================
// make Item class

// 카테고리 나누는 enum
enum ItemCategory {
  total,
  memorized,
  notMemorized,
}

// csv to <List<Item>>
Future<List<Item>> parseCsvAndGenerateItems(String csvContent) async {
  List<List<dynamic>> csvRows = const CsvToListConverter().convert(csvContent);
  List<Item> items = [];

  for (var row in csvRows.skip(1)) {
    final isMemorized = row[5] == 1;
    final page = int.tryParse(row[3].toString()) ?? 0;

    items.add(
      Item(
        wordId: row[0],
        arabicWord: row[1],
        koreanMeaning: row[2],
        page: page,
        grammaticalType: row[4],
        isMemorized: isMemorized,
        root: row[6],
        info: row[7],
      ),
    );
  }

  return items;
}

// SINGLETON DATA MANAGER 객체
class ItemDataManager {
  static final ItemDataManager _instance = ItemDataManager._internal();
  factory ItemDataManager() => _instance;

  ItemDataManager._internal();

  List<Item> _originalItems = [];
  List<Item> _totalItemList = [];
  List<Item> _memorizedItemList = [];
  List<Item> _notMemorizedItemList = [];

// TODO 나중에 modify 하기 : 여러 csvFilePath 받을 경우
  Future<void> loadData() async {
    if (_originalItems.isEmpty) {
      String csvContent = await rootBundle.loadString('assets/csv/DUMMY.csv');
      _originalItems = await parseCsvAndGenerateItems(csvContent);

      _totalItemList = List.from(_originalItems);
      _memorizedItemList =
          _originalItems.where((item) => item.isMemorized).toList();
      _notMemorizedItemList =
          _originalItems.where((item) => !item.isMemorized).toList();
    }
  }

  List<Item> getShuffledItems() {
    List<Item> shuffledItems = List.from(_originalItems)..shuffle();
    return shuffledItems;
  }

  List<Item> get items => _originalItems;
  List<Item> get totalItemList => _totalItemList;
  List<Item> get memorizedItemList => _memorizedItemList;
  List<Item> get notMemorizedItemList => _notMemorizedItemList;

  int getTotalItemCount() => _originalItems.length;

  int getMemorizedItemCount() => _memorizedItemList.length;

  int getNotMemorizedItemCount() => _notMemorizedItemList.length;
}
