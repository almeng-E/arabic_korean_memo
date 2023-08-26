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
  String arabicWord, koreanMeaning, grammaticalType, root, info;
  bool isMemorized;
}
