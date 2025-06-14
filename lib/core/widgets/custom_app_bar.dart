import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

AppBar buildAppBar(context, title) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(title, style: AppTextStyles.bold19),
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_new),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
