import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipable_stack/swipable_stack.dart';

import 'package:arabic_korean_memo/data/item_class.dart';
import 'package:arabic_korean_memo/data/item_provider.dart';

// =========================================================================
class FlashCards extends StatefulWidget {
  final String state;

  const FlashCards({
    super.key,
    required this.state,
  });

  @override
  State<FlashCards> createState() => _FlashCardsState();
}

class _FlashCardsState extends State<FlashCards> {
  // Initially show Arabic meaning
  bool _showArabic = true;
  late List<Item> _items;

  late final SwipableStackController _controller;
  void _listenController() => setState(() {});

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize _items based on the selected state
    if (widget.state == 'memorized') {
      _items = List.from(Provider.of<ItemProvider>(context).memorizedItems);
    } else if (widget.state == 'notMemorized') {
      _items = List.from(Provider.of<ItemProvider>(context).notMemorizedItems);
    } else {
      _items = List.from(Provider.of<ItemProvider>(context).totalItems);
    }
    _items.shuffle();
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
      _items.shuffle();
      _controller.currentIndex = 0;
      _showArabic = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '플래시 카드',
          style: TextStyle(
            fontSize: 18,
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
      // BODY : ITEM PROVIDER____________________________________________________+카드 스택
      body: Consumer<ItemProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              // PROGRESS INDICATOR BAR ______________________________________________________
              SizedBox(
                width: double.infinity,
                height: 15,
                child: LinearProgressIndicator(
                  value: _controller.currentIndex / _items.length,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.secondary,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  // semanticsValue:
                  //     '${((_controller.currentIndex / _items.length) * 100).toStringAsFixed(1)}%',
                ),
              ),
              // 카드 스택 ______________________________________________________________
              Expanded(
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
                                itemCount: _items.length,
                                detectableSwipeDirections: const {
                                  SwipeDirection.left,
                                  SwipeDirection.right,
                                },
                                controller: _controller,
                                stackClipBehaviour: Clip.none,
                                horizontalSwipeThreshold: 0.8,
                                swipeAnchor: SwipeAnchor.top,
                                overlayBuilder: (context, swipeProperty) {
                                  if (swipeProperty.direction ==
                                          SwipeDirection.right &&
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
                                    _showArabic = true;
                                    print(
                                        'Left! $index'); // Print 'Left' when swiped left
                                  } else if (direction ==
                                      SwipeDirection.right) {
                                    _showArabic = true;
                                    print(
                                        'Right! $index'); // Print 'Right' when swiped right
                                  }
                                },
                                builder: (context, swipeProperty) {
                                  final index = swipeProperty.index;
                                  if (index >= _items.length) {
                                    // If index exceeds the data length, return an empty container
                                    return const SizedBox();
                                  }
                                  final item = _items[index];
                                  final cardContent =
                                      swipeProperty.stackIndex == 0
                                          ? (_showArabic
                                              ? item.arabicWord
                                              : item.koreanMeaning)
                                          : item.arabicWord;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showArabic = !_showArabic;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
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
                                          cardContent,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.clip,
                                          maxLines: 5,
                                          style: const TextStyle(
                                            fontSize: 40,
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
                    // BUTTONS FOR THE CARD STACK ______________________________________________________
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Ink(
                          decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.clear_outlined),
                            iconSize: 40,
                            color: Colors.white,
                            tooltip: '모르는 단어에요',
                            onPressed: () {
                              _controller.next(
                                  swipeDirection: SwipeDirection.left);
                            },
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.refresh_outlined),
                            iconSize: 40,
                            color: Colors.white,
                            tooltip: '다시하기 / 셔플',
                            onPressed: () {
                              _refreshCards();
                            },
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.circle_outlined),
                            iconSize: 37,
                            color: Colors.white,
                            tooltip: '아는 단어에요',
                            onPressed: () {
                              _controller.next(
                                  swipeDirection: SwipeDirection.right);
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
