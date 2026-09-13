import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/fruite_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 200,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => const FruiteItem(),
    );
  }
}
