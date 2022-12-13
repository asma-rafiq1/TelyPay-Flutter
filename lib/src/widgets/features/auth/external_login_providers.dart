import 'package:flutter/material.dart';
import '../../../constants/constant_data.dart';
import '../../global/controls/icon_button.dart';

class ExternalLoginProvider extends StatelessWidget {
  const ExternalLoginProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          Text(
            "- Or sign in with -",
            style: TextStyle(color: Colors.grey.shade700),
          ),
          const Spacer(),
          Wrap(
            spacing: 10,
            children: AppConstantData.loginProviders.map((iconData) {
              return CustomIconButton(
                iconData: iconData,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
