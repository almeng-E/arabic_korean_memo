import 'package:flutter/material.dart';

// =========================================================================
class MenuCard extends StatefulWidget {
  final Icon menuIcon;
  final String menuName, description;
  final Widget route;
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
      color: Theme.of(context).primaryColor,
      child: InkWell(
        borderRadius: widget._baseBorderRadius,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.route),
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
                height: 100,
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
