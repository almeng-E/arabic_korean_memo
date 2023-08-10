import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/themes/my_icons.dart';

class StudyCardMenu extends StatefulWidget {
  const StudyCardMenu({super.key});

  @override
  State<StudyCardMenu> createState() => _StudyCardMenuState();
}

class _StudyCardMenuState extends State<StudyCardMenu> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                  child: const Icon(CustomIcon.flashCard),
                ),
                const Text('제목'),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(3),
              child: Text('설명'),
            ),
          ],
        ),
      ),
    );
  }
}
