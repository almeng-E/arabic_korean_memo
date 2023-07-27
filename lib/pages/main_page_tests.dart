import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:flutter/material.dart';

class MainPageTests extends StatefulWidget {
  const MainPageTests({super.key});

  @override
  State<MainPageTests> createState() => _MainPageTestsState();
}

class _MainPageTestsState extends State<MainPageTests> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
      decoration: const BoxDecoration(
        color: mainPink,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.red),
                    color: tmpBlue,
                  ),
                ),
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.red),
                    color: tmpGreen,
                  ),
                ),
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.red),
                    color: tmpOrange,
                  ),
                ),
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.red),
                    color: tmpRed,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.red),
              color: Colors.amber,
            ),
            child: const Text('테스트 CARDS'),
          ),
        ],
      ),
    );
  }
}
