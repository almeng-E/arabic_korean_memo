import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/layouts/app_bar.dart';
import 'package:arabic_korean_memo/themes/my_icons.dart';
import 'package:arabic_korean_memo/themes/my_colors.dart';

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
          // *********************************상단 앱 바
          const MainPageAppBar(
            pageName: '단어장',
            appBarButtons: Row(
              children: [
                Icon(
                  CustomIcon.search,
                  size: 23,
                ),
                Icon(
                  CustomIcon.sliders,
                  size: 23,
                ),
                Icon(
                  CustomIcon.shuffle,
                  size: 23,
                ),
              ],
            ),
          ),

          // Expanded로 flex 추가, 빈 공간 꽉 채움
          // *********************************바디 부분
          Expanded(
            child: SizedBox(
              width: double.infinity,
              // ##############################################컨테이너는 임시 색 구분용임 나중에 삭제
              child: Container(
                decoration: const BoxDecoration(
                  color: mainMint,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                      ),
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
