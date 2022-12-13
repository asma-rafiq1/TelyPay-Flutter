import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Styles {
  static const SCAFFOLD_PADDING = EdgeInsets.symmetric(horizontal: 30);
  static const PRIMARY_HEADING =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  static const SizedBoxH20 = SizedBox(
    height: 20,
  );

  static const SizedBoxH40 = SizedBox(
    height: 40,
  );

  static const TEXTSTYLE = SizedBox(
    height: 40,
  );

  static AppBarTheme appBarTheme = AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.white, size: 20),
      backgroundColor: Colors.white);
}
