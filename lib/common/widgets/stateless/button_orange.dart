import 'package:flutter/material.dart';
import 'package:zingoapp/utils/app_colors.dart';
import 'package:zingoapp/utils/app_text_styles.dart';

class ButtonOrange extends StatelessWidget {
  final String? title;
  const ButtonOrange({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColor.orangeLight,
                AppColor.orangeStrong,
              ])),
      child: Center(
          child: Text(
        title.toString(),
        style: AppStyles.h3,
      )),
    );
  }
}
