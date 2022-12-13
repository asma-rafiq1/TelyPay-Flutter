import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mock_flutter_app/src/constants/styles.dart';
import 'package:mock_flutter_app/src/navigation/route_names.dart';
import 'package:provider/provider.dart';
import 'src/features/auth/services/auth_service.dart';
import 'src/features/products/services/product_service.dart';
import 'src/navigation/route_generator.dart';

void main() {
  runApp(ChangeNotifierProvider<ProductService>(
      create: (_) => ProductService(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService usercontroller = Get.put(AuthService());
    ProductService productcontroller = Get.put(ProductService());

    return MaterialApp(
        title: 'Pay Acorn',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: Styles.appBarTheme,
        ),
        initialRoute: RouteName.login,
        onGenerateRoute: RouteGenerator.generateRoute);
  }
}
