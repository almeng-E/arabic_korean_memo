import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:arabic_korean_memo/data/item_class.dart';
import 'package:arabic_korean_memo/data/item_provider.dart';

// =========================================================================
class FourChoice extends StatefulWidget {
  final String state;

  const FourChoice({
    super.key,
    required this.state,
  });

  @override
  State<FourChoice> createState() => _FourChoiceState();
}

class _FourChoiceState extends State<FourChoice> {
  late List<Item> _items;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize _items based on the selected state
    if (widget.state == 'memorized') {
      _items = List.from(Provider.of<ItemProvider>(context).memorizedItems);
    } else if (widget.state == 'notMemorized') {
      _items = List.from(Provider.of<ItemProvider>(context).notMemorizedItems);
    } else {
      _items = List.from(Provider.of<ItemProvider>(context).totalItems);
    }
    _items.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '사지선다',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Consumer<ItemProvider>(
        builder: (context, provider, child) {
          return const Center(
            child: Text('사지선다 페이지'),
          );
        },
      ),
    );
  }
}
