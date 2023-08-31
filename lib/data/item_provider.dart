import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

import 'package:arabic_korean_memo/data/item_class.dart';
// =========================================================================

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

class ItemProvider with ChangeNotifier {
  static const String _csvFilePath = 'assets/csv/DUMMY.csv';

  List<Item> _totalItems = [];
  List<Item> _memorizedItems = [];
  List<Item> _notMemorizedItems = [];

  bool _isLoading = false;

  Future<void> loadData() async {
    if (!_isLoading && _totalItems.isEmpty) {
      _isLoading = true;

      String csvContent = await rootBundle.loadString(_csvFilePath);

      _totalItems = await parseCsvAndGenerateItems(csvContent);

      _memorizedItems = _totalItems.where((item) => item.isMemorized).toList();
      _notMemorizedItems =
          _totalItems.where((item) => !item.isMemorized).toList();

      _isLoading = false;

      notifyListeners();
    }
  }

  List<Item> getShuffledItems() {
    List<Item> shuffledItems = List.from(_totalItems)..shuffle();
    return shuffledItems;
  }

  List<Item> get totalItems => _totalItems;
  List<Item> get memorizedItems => _memorizedItems;
  List<Item> get notMemorizedItems => _notMemorizedItems;

  int getTotalItemCount() => _totalItems.length;
  int getMemorizedItemCount() => _memorizedItems.length;
  int getNotMemorizedItemCount() => _notMemorizedItems.length;
}
