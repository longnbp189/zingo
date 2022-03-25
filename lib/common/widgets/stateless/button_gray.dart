import 'package:flutter/material.dart';
import 'package:zingoapp/utils/app_colors.dart';
import 'package:zingoapp/utils/app_text_styles.dart';

class ButtonGray extends StatelessWidget {
  final String? title;
  const ButtonGray({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade400),
      child: Center(
          child: Text(
        title.toString(),
        style: AppStyles.h3.copyWith(color: AppColor.textOrange),
      )),
    );
  }
}
