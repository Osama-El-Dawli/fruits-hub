import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/services/shared_prefrences.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
    required this.isVisible,
  });
  final String image;
  final String backgroundImage;
  final Widget title;
  final String subTitle;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(image),
                ),
                Visibility(
                  visible: isVisible,
                  child: InkWell(
                    onTap: () {
                      Prefs.setBool('isOnBoardingSeen', true);
                      Navigator.pushReplacementNamed(
                        context,
                        LoginView.routeName,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'تخط',
                        style: AppTextStyles.regular13.copyWith(
                          color: Color(0xff949D9E),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 64),
          title,
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37),
            child: Text(
              subTitle,
              style: AppTextStyles.semiBold13.copyWith(
                color: Color(0xff4E5556),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
