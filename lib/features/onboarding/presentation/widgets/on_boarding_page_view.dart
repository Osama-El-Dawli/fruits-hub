import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/onboarding/presentation/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.controller,
    required this.onPageChanged,
    required this.currentPage,
  });
  final PageController controller;
  final void Function(int) onPageChanged;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: onPageChanged,
      children: [
        PageViewItem(
          isVisible: true,
          image: Assets.imagesPageViewItem1Image,
          backgroundImage: Assets.imagesPageViewItem1Background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحبًا بك في', style: AppTextStyles.bold23),
              Text(
                ' HUB',
                style: AppTextStyles.bold23.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                'Fruit',
                style: AppTextStyles.bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        PageViewItem(
          isVisible: false,
          image: Assets.imagesPageViewItem2Image,
          backgroundImage: Assets.imagesPageViewItem2Background,
          title: const Text(
            'ابحث وتسوق',
            style: AppTextStyles.bold23,
            textAlign: TextAlign.center,
          ),
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
        ),
      ],
    );
  }
}
