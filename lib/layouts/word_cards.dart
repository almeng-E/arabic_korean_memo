import 'package:flutter/material.dart';

// Item 이라는 클래스 선언
class Item {
  Item({
    required this.id,
    required this.headerValue,
    required this.expandedValue,
  });
  int id;
  String headerValue;
  String expandedValue;
}

// Item을 요소로 가지는 List 생성(genereate)       << 추후 csv file 로 교체?
List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      id: index,
      headerValue: 'ARABIC WORD $index',
      expandedValue: 'ARABIC WORD $index 의 세부 정보들!',
    );
  });
}

class WordCards extends StatefulWidget {
  const WordCards({super.key});

  @override
  State<WordCards> createState() => _WordCardsState();
}

class _WordCardsState extends State<WordCards> {
  // 사용될 아이템 리스트 _data 생성
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList.radio(
      dividerColor: Colors.amber,
      // initialOpenPanelValue: 2, : 처음 열리는 value 설정도 가능
      children: _data.map<ExpansionPanelRadio>((Item item) {
        return ExpansionPanelRadio(
          canTapOnHeader: true,
          value: item.id,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              // title에 위젯이 들어갈 수 있음.
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.headerValue),
                  const Text('한글 뜻'),
                ],
              ),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            subtitle: const Text('SUBTITLE~~~~~~~~~~~~~~~~'),
          ),
        );
      }).toList(),
    );
  }
}
