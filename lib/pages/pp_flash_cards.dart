import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:arabic_korean_memo/widgets/w_csv_to_item.dart';
import 'package:swipable_stack/swipable_stack.dart';

class FlashCards extends StatefulWidget {
  const FlashCards({super.key});

  @override
  State<FlashCards> createState() => _FlashCardsState();
}

class _FlashCardsState extends State<FlashCards> {
  List<Item> _data = []; // List of items

  late final SwipableStackController _controller;
  void _listenController() => setState(() {});
  bool _showArabic = true; // Initially show Arabic meaning

  @override
  void initState() {
    super.initState();
    _loadCsvData();

    _controller = SwipableStackController()..addListener(_listenController);
  }

  Future<void> _loadCsvData() async {
    String csvContent = await rootBundle.loadString('assets/csv/DUMMY.csv');
    List<Item> items = await parseCsvAndGenerateItems(csvContent);
    setState(() {
      _data = items;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '플래시 카드',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shuffle_rounded),
            color: Colors.black,
            tooltip: '셔플',
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 300,
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SwipableStack(
                    itemCount: _data.length,
                    detectableSwipeDirections: const {
                      SwipeDirection.left,
                      SwipeDirection.right,
                    },
                    controller: _controller,
                    stackClipBehaviour: Clip.none, // ??
                    horizontalSwipeThreshold: 0.8,

                    onSwipeCompleted: (index, direction) {
                      if (direction == SwipeDirection.left) {
                        print('Left $index'); // Print 'Left' when swiped left
                      } else if (direction == SwipeDirection.right) {
                        print(
                            'Right $index'); // Print 'Right' when swiped right
                      }
                    },
                    builder: (context, swipeProperty) {
                      final index = swipeProperty.index;
                      // if (index == _data.length + 1) {
                      //   print('done');
                      //   return Container(); // Leave this empty for now
                      // }
                      final item = _data[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _showArabic = !_showArabic;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                              )
                            ],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 400,
                          width: 300,
                          child: Center(
                            child: Text(
                              _showArabic
                                  ? item.arabicWord
                                  : item.koreanMeaning,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
