import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/widgets/w_memorized_button.dart';
import 'package:arabic_korean_memo/widgets/w_menu_card.dart';
import 'package:arabic_korean_memo/themes/my_icons.dart';

// =========================================================================
class MainPageStudy extends StatefulWidget {
  const MainPageStudy({super.key});

  @override
  State<MainPageStudy> createState() => _MainPageStudyState();
}

class _MainPageStudyState extends State<MainPageStudy> {
  // DataCategory selectedCategory = DataCategory.total;

  // void handleCategoryChange(DataCategory category) {
  //   setState(() {
  //     selectedCategory = category;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '학습',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(CustomIcon.sliders),
            color: Colors.black,
            tooltip: '범위설정',
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
        child: Column(
          children: [
            // ********************************* 색전환 버튼들
            const MemorizedButton(
              totalItemCount: 100, // Replace with actual total item count
              memorizedItemCount:
                  75, // Replace with actual memorized item count
              notMemorizedItemCount:
                  25, // Replace with actual not memorized item count
              // onCategorySelected: handleCategoryChange,
            ),
            // 빈 공간 SPACING
            const SizedBox(
              height: 22,
            ),
            // 메뉴 버튼들
            Table(
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    MenuCard(
                      menuIcon: const Icon(Icons.style_outlined),
                      menuName: '플래시 카드',
                      description: '메뉴 설명들 ~~~~~~~~~~~~~~~~',
                      route: '/flashcards',
                    ),
                    MenuCard(
                      menuIcon:
                          const Icon(Icons.local_fire_department_outlined),
                      menuName: '단어 멍',
                      description: '단어를 보면서 멍을 때려요',
                      route: '/wordblink',
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: MenuCard(
                        menuIcon: const Icon(Icons.mosque_outlined),
                        // OR  icons.school,  account_balance
                        menuName: '문법 요약',
                        description: '헷갈리는 문법 사항을 빠르게 체크해요',
                        route: '/grammar',
                      ),
                    ),
                    const SizedBox.shrink(), // Empty cell
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
