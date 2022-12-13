import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../typography/primary_heading.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {Key? key,
      required this.btnText,
      required this.verticalPadding,
      required this.onPressed})
      : super(key: key);

  final String btnText;
  final double verticalPadding;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: AppColors.ACCENT_COLOR,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width)),
        child: PrimaryHeading(
          headingText: btnText,
          verticalPadding: verticalPadding,
        ));
  }
}
