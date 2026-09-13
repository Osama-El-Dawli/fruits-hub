import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeViewBody()),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
