import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/assets.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });
  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChecked(!isChecked),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: isChecked ? Colors.transparent : Color(0xffDDDFDF),
              width: 1.5,
            ),
          ),
        ),
        child: isChecked
            ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(Assets.imagesCheckIcon),
              )
            : const SizedBox(),
      ),
    );
  }
}
