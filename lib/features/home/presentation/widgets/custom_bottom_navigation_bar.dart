import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:fruits_hub/features/home/presentation/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 7,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final int itemCount = bottomNavigationBarItems.length;
          const int selectedShares = 3;
          const int unselectedShares = 2;
          final int totalShares =
              selectedShares + unselectedShares * (itemCount - 1);
          final double unitWidth = constraints.maxWidth / totalShares;

          return Row(
            children: bottomNavigationBarItems
                .asMap()
                .entries
                .map(
                  (entity) => AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                    width: entity.key == selectedIndex
                        ? unitWidth * selectedShares
                        : unitWidth * unselectedShares,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = entity.key;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: NavigationBarItem(
                          isSelected: entity.key == selectedIndex,
                          bottomNavigationBarEntity: entity.value,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
