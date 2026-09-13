import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles.regular16.copyWith(color: const Color(0xff949D9E)),
      ),
      subtitle: const Text('أحمد مصطفي', style: AppTextStyles.bold16),
      trailing: CircleAvatar(
        backgroundColor: const Color(0xffEEF8ED),
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
    );
  }
}
