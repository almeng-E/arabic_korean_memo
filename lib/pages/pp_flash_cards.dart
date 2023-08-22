import 'package:flutter/material.dart';

import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:arabic_korean_memo/widgets/d_data_manager.dart';

import 'package:swipable_stack/swipable_stack.dart';

// =========================================================================
class FlashCards extends StatefulWidget {
  const FlashCards({super.key});

  @override
  State<FlashCards> createState() => _FlashCardsState();
}

class _FlashCardsState extends State<FlashCards> {
  List<Item> data = [];
  // Initially show Arabic meaning
  bool _showArabic = true;
  late final SwipableStackController _controller;
  void _listenController() => setState(() {});

  @override
  void initState() {
    super.initState();
    data = ItemDataManager().items;
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  void _refreshCards() {
    setState(() {
      data = ItemDataManager().getShuffledItems();
      _controller.currentIndex = 0;
    });
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: 300,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SwipableStack(
                        itemCount: data.length,
                        detectableSwipeDirections: const {
                          SwipeDirection.left,
                          SwipeDirection.right,
                        },
                        controller: _controller,
                        stackClipBehaviour: Clip.none, // ??
                        horizontalSwipeThreshold: 0.8,

                        overlayBuilder: (context, swipeProperty) {
                          if (swipeProperty.direction == SwipeDirection.right &&
                              swipeProperty.swipeProgress > 0.5) {
                            return const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Icon(
                                  Icons.circle_outlined,
                                  size: 50,
                                  color: Colors.green,
                                ),
                              ),
                            );
                          } else if (swipeProperty.direction ==
                                  SwipeDirection.left &&
                              swipeProperty.swipeProgress > 0.5) {
                            return const Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Icon(
                                  Icons.clear_outlined,
                                  size: 50,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },

                        onSwipeCompleted: (index, direction) {
                          if (direction == SwipeDirection.left) {
                            print(
                                'Left! $index'); // Print 'Left' when swiped left
                          } else if (direction == SwipeDirection.right) {
                            print(
                                'Right! $index'); // Print 'Right' when swiped right
                          }
                        },
                        builder: (context, swipeProperty) {
                          final index = swipeProperty.index;
                          if (index >= data.length) {
                            // If index exceeds the data length, return an empty container
                            return const SizedBox();
                          }
                          final item = data[index];

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _showArabic = !_showArabic;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: hermesOrange,
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
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Ink(
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: hermesOrange,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.clear_outlined),
                    iconSize: 40,
                    color: Colors.white,
                    tooltip: '모르는 단어에요',
                    onPressed: () {
                      _controller.next(swipeDirection: SwipeDirection.left);
                    },
                  ),
                ),
                Ink(
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: hermesOrange,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.refresh_outlined),
                    iconSize: 40,
                    color: Colors.white,
                    tooltip: '다시하기 / 셔플',
                    onPressed: _refreshCards,
                  ),
                ),
                Ink(
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: hermesOrange,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.circle_outlined),
                    iconSize: 37,
                    color: Colors.white,
                    tooltip: '아는 단어에요',
                    onPressed: () {
                      _controller.next(swipeDirection: SwipeDirection.right);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
