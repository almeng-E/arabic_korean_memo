import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:flutter/material.dart';

class MainPageStudy extends StatefulWidget {
  const MainPageStudy({super.key});

  @override
  State<MainPageStudy> createState() => _MainPageStudyState();
}

class _MainPageStudyState extends State<MainPageStudy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
      decoration: const BoxDecoration(
        color: mainGreen,
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
          // ###################Expanded 는임시용
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.red),
              color: Colors.amber,
            ),
            child: const Text('학습 CARDS'),
          ),
        ],
      ),
    );
  }
}
