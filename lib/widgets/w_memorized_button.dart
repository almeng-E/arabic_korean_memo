import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:flutter/material.dart';

// =========================================================================
class _Constants {
  static const double containerWidth = 60;
  static const double containerHeight = 40;
  static const double labelFontSize = 20;
  static const double iconSize = 24;
}

class MemorizedButton extends StatelessWidget {
  const MemorizedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: _Constants.containerHeight + _Constants.containerWidth,
      width: _Constants.containerWidth * 3,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClickableContainer(
              label: 'A',
              labelIcon: Text(
                '전체',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: _Constants.labelFontSize,
                ),
              ),
            ),
            ClickableContainer(
              label: 'B',
              labelIcon: Icon(
                Icons.circle_outlined,
                color: Colors.white,
                size: _Constants.iconSize,
              ),
            ),
            ClickableContainer(
              label: 'C',
              labelIcon: Icon(
                Icons.clear_outlined,
                color: Colors.white,
                size: _Constants.iconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClickableContainer extends StatelessWidget {
  final String label;
  final Widget labelIcon;

  const ClickableContainer({
    super.key,
    required this.label,
    required this.labelIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle container click here
        print('Clicked on $label');
      },
      child: Column(
        children: [
          Container(
            width: _Constants.containerWidth,
            height: _Constants.containerHeight,
            decoration: const BoxDecoration(
              color: hermesOrange,
            ),
            child: Center(
              child: labelIcon,
            ),
          ),
          Container(
            width: _Constants.containerWidth,
            height: _Constants.containerWidth,
            decoration: BoxDecoration(
              color: hermesOrange.withOpacity(0.9),
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: _Constants.labelFontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 이후 data에 접근하는 법 배워야함. 버튼 클릭 시 해당 데이터만 접근하여 다시 렌더링하도록