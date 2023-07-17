import 'package:arabic_korean_memo/themes/colors.dart';
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
      color: mainPink,
    );
  }
}
