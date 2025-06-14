import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xffDDDFDF))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'أو',
            style: AppTextStyles.bold16.copyWith(color: Color(0xff0C0D0D)),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xffDDDFDF))),
      ],
    );
  }
}
