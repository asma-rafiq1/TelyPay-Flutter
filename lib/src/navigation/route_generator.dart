import 'package:flutter/material.dart';
import 'package:mock_flutter_app/src/features/auth/screens/login_screen.dart';
import 'package:mock_flutter_app/src/features/products/screens/edit_screen.dart';
import 'package:mock_flutter_app/src/navigation/route_names.dart';
import 'package:mock_flutter_app/src/widgets/home.dart';

import '../features/products/models/single_product_model.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteName.editProduct:
        if (args is SingleProductModel) {
          return MaterialPageRoute(
              builder: (context) => EditScreen(
                    singleProductModel: args,
                  ));
        }
        return _errorRoute();

      // case '/':
      //   if (args is String) {
      //     return MaterialPageRoute(builder: (_) => BasicRouting(data: args));
      //   }
      //return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(
          child: Text("Error"),
        ),
      );
    });
  }
}
