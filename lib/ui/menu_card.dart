import 'package:flutter/material.dart';

import 'package:arabic_korean_memo/themes/my_colors.dart';

// =========================================================================
class MenuCard extends StatefulWidget {
  final Icon menuIcon;
  final String menuName, description, route;
  final BorderRadius _baseBorderRadius = BorderRadius.circular(20);

  MenuCard({
    super.key,
    required this.menuIcon,
    required this.menuName,
    required this.description,
    required this.route,
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
        borderRadius: widget._baseBorderRadius,
      ),
      color: hermesOrange,
      child: InkWell(
        borderRadius: widget._baseBorderRadius,
        onTap: () {
          Navigator.pushNamed(
            context,
            widget.route,
          );
        },
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
                    width: 15,
                  ),
                  Text(
                    widget.menuName,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                height: 70,
                padding: const EdgeInsets.all(8),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
