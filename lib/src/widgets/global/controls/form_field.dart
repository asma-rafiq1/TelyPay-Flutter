import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {Key? key,
      required this.formFieldController,
      required this.controlLabel,
      required this.controlIcon,
      required this.validator,
      this.iconOnPress,
      this.autofocus = false,
      this.obscuringCharacter = "*",
      this.obscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text})
      : super(key: key);

  final TextEditingController formFieldController;
  final String controlLabel;
  final Widget controlIcon;
  VoidCallback? iconOnPress;
  String? Function(String?)? validator;
  bool obscureText;
  String obscuringCharacter;
  TextInputAction textInputAction;
  TextInputType textInputType;
  bool autofocus;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7)
          ]),
      child: TextFormField(
        controller: formFieldController,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        autofocus: autofocus,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          label: Text(controlLabel),
          suffixIcon: IconButton(
            icon: controlIcon,
            onPressed: iconOnPress,
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
      ),
    );
  }
}
