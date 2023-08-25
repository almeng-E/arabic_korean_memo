import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:flutter/material.dart';

// =========================================================================
class _Constants {
  static const double containerWidth = 60;
  static const double containerHeight = 40;
  static const double labelFontSize = 20;
  static const double iconSize = 24;
}

enum DataCategory {
  total,
  memorized,
  notMemorized,
}

class MemorizedButton extends StatelessWidget {
  final int totalItemCount;
  final int memorizedItemCount;
  final int notMemorizedItemCount;
  // final Function(DataCategory) onCategorySelected;

  const MemorizedButton({
    super.key,
    required this.totalItemCount,
    required this.memorizedItemCount,
    required this.notMemorizedItemCount,
    // required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _Constants.containerHeight + _Constants.containerWidth,
      width: _Constants.containerWidth * 3,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClickableContainer(
              label: '$totalItemCount',
              labelIcon: const Text(
                '전체',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: _Constants.labelFontSize,
                ),
              ),
              // onTap: () {
              //   onCategorySelected(DataCategory.total);
              // },
            ),
            ClickableContainer(
              label: '$memorizedItemCount',
              labelIcon: const Icon(
                Icons.circle_outlined,
                color: Colors.white,
                size: _Constants.iconSize,
              ),
              // onTap: () {
              //   onCategorySelected(DataCategory.memorized);
              // },
            ),
            ClickableContainer(
              label: '$notMemorizedItemCount',
              labelIcon: const Icon(
                Icons.clear_outlined,
                color: Colors.white,
                size: _Constants.iconSize,
              ),
              // onTap: () {
              //   onCategorySelected(DataCategory.notMemorized);
              // },
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
  // final VoidCallback onTap;

  const ClickableContainer({
    super.key,
    required this.label,
    required this.labelIcon,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, //onTap,
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

//TODO 이후 data에 접근하는 법 배워야함. 버튼 클릭 시 해당 데이터만 접근하여 다시 렌더링하도록