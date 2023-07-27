import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/themes/my_colors.dart';

class MainPageWords extends StatefulWidget {
  const MainPageWords({super.key});

  @override
  State<MainPageWords> createState() => _MainPageWordsState();
}

class _MainPageWordsState extends State<MainPageWords> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
      decoration: const BoxDecoration(
        color: mainMint,
      ),
      child: Column(
        children: [
          // ********************************* 색전환 버튼들
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.red),
                color: Colors.amber,
              ),
              child: const Text('LIST-VIEW 들어갈 곳'),
            ),
          ),
        ],
      ),
    );
  }
}
