import 'package:flutter/material.dart';
import '../../../constants/styles.dart';

class PrimaryHeading extends StatelessWidget {
  const PrimaryHeading(
      {Key? key, required this.headingText, required this.verticalPadding})
      : super(key: key);

  final String headingText;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Text(
        headingText,
        style: Styles.PRIMARY_HEADING,
      ),
    );
  }
}
