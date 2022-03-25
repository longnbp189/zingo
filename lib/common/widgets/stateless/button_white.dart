import 'package:flutter/material.dart';
import 'package:zingoapp/utils/app_colors.dart';
import 'package:zingoapp/utils/app_text_styles.dart';

class ButtonWhite extends StatelessWidget {
  final String? title;
  const ButtonWhite({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Center(
          child: Text(
        title.toString(),
        style: AppStyles.h3.copyWith(color: AppColor.textOrange),
      )),
    );
  }
}
