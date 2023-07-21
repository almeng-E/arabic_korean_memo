import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/themes/colors.dart';

class MainPageWords extends StatefulWidget {
  const MainPageWords({super.key});

  @override
  State<MainPageWords> createState() => _MainPageWordsState();
}

class _MainPageWordsState extends State<MainPageWords> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          // 상단 앱 바
          SafeArea(
            child: SizedBox(
              height: 80,
              child: Column(
                children: [
                  const SizedBox(
                    height: 22,
                    width: double.infinity,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          color: Colors.green,
                          child: const Text(
                            'Container1',
                          ),
                        ),
                        Container(
                          color: Colors.amber,
                          child: const Icon(Icons.ac_unit_outlined),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),

          // Expanded로 flex 추가, 빈 공간 꽉 채움
          // 바디 부분
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 10, color: Colors.red),
                color: mainBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
