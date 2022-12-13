import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mock_flutter_app/src/features/auth/models/user_model.dart';
import 'package:mock_flutter_app/src/navigation/route_names.dart';
import 'package:mock_flutter_app/src/repository/auth/auth_repository.dart';
import 'package:mock_flutter_app/src/repository/auth/http_auth_repository.dart';
import 'package:mock_flutter_app/src/utils/app_endpoints.dart';
import 'package:mock_flutter_app/src/utils/dialog_helper.dart';

class AuthService extends GetxController {
  final AuthRepository _authRepository = HttpAuthRepository();
  var _user = UserModel(email: "", password: "").obs;

  Future<dynamic> loginUser(UserModel userModel, BuildContext context) async {
    var response = await _authRepository
        .loginApi(ApplicationEndpoints.loginApiEndpoint, userModel.toMap())
        .onError((error, stackTrace) {
      Utils.showFlushBar(context, error.toString());
    });
    _user.value = userModel;
    Utils.showSnackBar(context, "Login Successful");
    Navigator.popAndPushNamed(context, RouteName.home);
  }
}
