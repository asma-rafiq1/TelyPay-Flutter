import 'package:flutter/material.dart';
import 'package:mock_flutter_app/src/constants/colors.dart';
import 'package:mock_flutter_app/src/constants/images.dart';
import 'package:mock_flutter_app/src/constants/styles.dart';
import 'package:mock_flutter_app/src/features/auth/models/user_model.dart';
import 'package:mock_flutter_app/src/features/auth/services/auth_service.dart';
import 'package:mock_flutter_app/src/widgets/features/auth/external_login_providers.dart';
import 'package:mock_flutter_app/src/widgets/global/typography/primary_heading.dart';
import 'package:mock_flutter_app/src/widgets/global/clipper/wave_clipper.dart';

import '../../../widgets/global/controls/elevated_btn.dart';
import '../../../widgets/global/controls/form_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  String? emailValidator(value) {
    if (value!.isEmpty
        //     RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value)
        ) {
      return "Enter valid Email Address";
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value!.isEmpty) {
      return "Enter valid Password";
    }
    return null;
  }

  void onFormsubmit() {
    if (_formKey.currentState!.validate()) {
      UserModel user = UserModel(
          email: _emailController.text, password: _passwordController.text);
      _authService.loginUser(user, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            AppImages.APP_LOGO,
            fit: BoxFit.fitHeight,
          ),
        ),
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
        Container(
          padding: Styles.SCAFFOLD_PADDING,
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrimaryHeading(
                  headingText: "Login to your Account", verticalPadding: 20),
              Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CustomFormField(
                            formFieldController: _emailController,
                            controlLabel: "Email",
                            controlIcon: const Icon(Icons.mail),
                            textInputType: TextInputType.emailAddress,
                            validator: emailValidator),
                        Styles.SizedBoxH20,
                        ValueListenableBuilder(
                          valueListenable: _obscurePassword,
                          builder: (BuildContext context, dynamic value,
                              Widget? child) {
                            return CustomFormField(
                              formFieldController: _passwordController,
                              controlLabel: "Password",
                              obscureText: _obscurePassword.value,
                              obscuringCharacter: "*",
                              textInputAction: TextInputAction.done,
                              validator: passwordValidator,
                              controlIcon: _obscurePassword.value
                                  ? const Icon(Icons.visibility_off_outlined)
                                  : const Icon(Icons.visibility),
                              iconOnPress: () {
                                _obscurePassword.value =
                                    !_obscurePassword.value;
                              },
                            );
                          },
                        ),
                        Styles.SizedBoxH40,
                        CustomElevatedButton(
                            btnText: "SignIn",
                            verticalPadding: 13,
                            onPressed: onFormsubmit),
                        Styles.SizedBoxH40,
                        const ExternalLoginProvider(),
                      ]))
            ],
          ),
        )
      ]),
    );
  }
}
