import 'package:flutter/material.dart';

// =========================================================================
class MainPageSettings extends StatefulWidget {
  const MainPageSettings({super.key});

  @override
  State<MainPageSettings> createState() => _MainPageSettingsState();
}

class _MainPageSettingsState extends State<MainPageSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '설정',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.red),
            color: Colors.amber,
          ),
          child: const Text('설정~'),
        ),
      ),
    );
  }
}
