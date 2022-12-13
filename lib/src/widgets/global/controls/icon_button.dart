import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {Key? key,
      required this.iconData,
      this.elevation = 5,
      this.horizontalPadding = 30})
      : super(key: key);
  final Map<String, dynamic> iconData;
  double elevation;
  double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          elevation: elevation,
          padding:
              EdgeInsets.symmetric(vertical: 10, horizontal: horizontalPadding),
          primary: Colors.white),
      child: Icon(
        iconData["icon"],
        color: iconData["color"],
      ),
    );
  }
}
