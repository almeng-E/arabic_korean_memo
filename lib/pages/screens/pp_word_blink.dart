import 'package:flutter/material.dart';

// =========================================================================
class WordBlink extends StatelessWidget {
  const WordBlink({super.key});

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
      body: const Center(
        child: BlinkingWordContainer(word: "Hello, Blink!"),
      ),
    );
  }
}

class BlinkingWordContainer extends StatefulWidget {
  final String word;

  const BlinkingWordContainer({super.key, required this.word});

  @override
  _BlinkingWordContainerState createState() => _BlinkingWordContainerState();
}

class _BlinkingWordContainerState extends State<BlinkingWordContainer> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();

    // Start the blinking animation when the widget is initialized.
    _startBlinking();
  }

  void _startBlinking() {
    // Toggle the visibility every second.
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _isVisible = !_isVisible;
        });
        _startBlinking(); // Repeat the process.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ColorTween(begin: Colors.transparent, end: Colors.transparent)
          .animate(const AlwaysStoppedAnimation(1)),
      builder: (context, child) {
        return Visibility(
          visible: _isVisible,
          child: Center(
            child: Text(
              widget.word,
              style: const TextStyle(fontSize: 24.0),
            ),
          ),
        );
      },
    );
  }
}

// I want to make a container that blinks the word. Blink means that it shows the word for 1 second and then hides it for 1 second. It repeats this process until the user stops it. How can I make it?
//
// I tried to use Timer.periodic() but it didn't work. I think it's because the Timer.periodic() is not a widget. I also tried to use AnimatedContainer but it didn't work either. I think it's because the AnimatedContainer is not a widget that can be used for blinking.
//
// I think I need to use setState() to make it work but I don't know how to use it.
//
// I'm a beginner in Flutter. Please help me.
//
// Thank you.
//
