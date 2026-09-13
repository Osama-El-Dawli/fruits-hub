import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:fruits_hub/features/home/presentation/widgets/active_item.dart';
import 'package:fruits_hub/features/home/presentation/widgets/in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: isSelected
          ? ActiveItem(
              key: const ValueKey('active'),
              image: bottomNavigationBarEntity.activeImage,
              name: bottomNavigationBarEntity.name,
            )
          : InActiveItem(
              key: const ValueKey('inactive'),
              image: bottomNavigationBarEntity.inActiveImage,
            ),
    );
  }
}
