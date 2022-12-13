import 'package:flutter/material.dart';
import 'package:mock_flutter_app/src/widgets/global/clipper/wave_clipper.dart';

import '../../../constants/colors.dart';

class QuadraticBezierClipper extends StatelessWidget {
  const QuadraticBezierClipper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.5,
          child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: AppColors.LIGHT_ACCENT_COLOR,
                height: 200,
              )),
        ),
        ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: AppColors.ACCENT_COLOR,
              height: 180,
            )),
      ],
    );
  }
}
