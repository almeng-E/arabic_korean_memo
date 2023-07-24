import 'package:flutter/material.dart';

class MainPageAppBar extends StatefulWidget {
  final String pageName;
  final Row appBarButtons;

  const MainPageAppBar({
    super.key,
    required this.pageName,
    required this.appBarButtons,
  });

  @override
  State<MainPageAppBar> createState() => _MainPageAppBarState();
}

class _MainPageAppBarState extends State<MainPageAppBar> {
  // late final Row iconRows;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(
        vertical: 22,
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.green,
            child: Text(
              widget.pageName,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Container(
            color: Colors.amber,
            child: widget.appBarButtons,
          )
        ],
      ),
    );
  }
}
