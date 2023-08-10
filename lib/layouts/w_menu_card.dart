import 'package:arabic_korean_memo/themes/my_colors.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatefulWidget {
  final Icon menuIcon;
  final String menuName, description;

  const MenuCard({
    super.key,
    required this.menuIcon,
    required this.menuName,
    required this.description,
  });

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: hermesOrange,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                  height: 50,
                  child: FittedBox(
                    child: widget.menuIcon,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  widget.menuName,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.description,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
