import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:flutter/material.dart';

class MainPageSettings extends StatefulWidget {
  const MainPageSettings({super.key});

  @override
  State<MainPageSettings> createState() => _MainPageSettingsState();
}

class _MainPageSettingsState extends State<MainPageSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
      decoration: const BoxDecoration(
        color: mainBlue,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.red),
          color: Colors.amber,
        ),
        child: const Text('설정~'),
      ),
    );
  }
}
