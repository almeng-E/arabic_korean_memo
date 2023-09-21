import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
// Import the Timer class

import 'package:arabic_korean_memo/data/item_class.dart';
import 'package:arabic_korean_memo/data/item_provider.dart';

// =========================================================================
class WordBlink extends StatefulWidget {
  final String state;

  const WordBlink({
    super.key,
    required this.state,
  });

  @override
  State<WordBlink> createState() => _WordBlinkState();
}

class _WordBlinkState extends State<WordBlink> {
  late List<Item> _items;
  final int _currentIndex = 0;

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '단어 멍',
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
      body: Consumer<ItemProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              // PROGRESS INDICATOR BAR ______________________________________________________
              SizedBox(
                width: double.infinity,
                height: 15,
                child: LinearProgressIndicator(
                  value: _currentIndex / _items.length,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.secondary,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  // semanticsValue:
                  //     '${((_controller.currentIndex / _items.length) * 100).toStringAsFixed(1)}%',
                ),
              ),
              Center(
                // Container that remains still with animated text
                child: Container(
                  width: 300,
                  height: 300,
                  alignment: Alignment.center,
                  color: Theme.of(context).colorScheme.primary,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      for (int i = 0; i < _items.length; i++) ...[
                        FadeAnimatedText(
                          _items[i].arabicWord,
                          duration: const Duration(milliseconds: 1500),
                          textStyle: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FadeAnimatedText(
                          _items[i].koreanMeaning,
                          duration: const Duration(milliseconds: 1500),
                          textStyle: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ],
                    pause: const Duration(milliseconds: 500),
                    totalRepeatCount: 1,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
