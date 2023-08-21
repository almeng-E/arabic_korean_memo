import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/themes/my_colors.dart';

// =========================================================================
class MemorizedButton extends StatelessWidget {
  const MemorizedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              color: tmpRed,
            ),
          ),
        ],
      ),
    );
  }
}
