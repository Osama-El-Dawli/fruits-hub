import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, realIndex) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: FeaturedItem(),
      ),
      options: CarouselOptions(
        aspectRatio: 342 / 158,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 1,
      ),
    );
  }
}
