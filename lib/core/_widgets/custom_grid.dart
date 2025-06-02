import 'package:flutter/material.dart';

class CustomGrid<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;
  final String emptyText;
  final double maxCrossAxisExtent;

  const CustomGrid({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.maxCrossAxisExtent = 300,
    this.emptyText = "No items found!",
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(child: Text(emptyText));
    }

    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      itemBuilder: (context, index) => itemBuilder(items[index]),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
