import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

AppBar buildAppBar(
  BuildContext context,
  String title, {
  bool showBackArrow = true,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(title, style: AppTextStyles.bold19),
    leading: showBackArrow
        ? Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffF1F1F5)),
              ),
              child: Center(
                child: Transform.translate(
                  offset: const Offset(2, 0),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          )
        : null,
  );
}
