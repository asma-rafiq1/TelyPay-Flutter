import 'package:flutter/material.dart';
import 'package:mock_flutter_app/src/constants/colors.dart';
import 'package:mock_flutter_app/src/constants/images.dart';
import 'package:mock_flutter_app/src/constants/styles.dart';
import 'package:mock_flutter_app/src/features/auth/models/user_model.dart';
import 'package:mock_flutter_app/src/features/auth/services/auth_service.dart';
import 'package:mock_flutter_app/src/features/products/services/product_service.dart';
import 'package:mock_flutter_app/src/widgets/features/auth/external_login_providers.dart';
import 'package:mock_flutter_app/src/widgets/global/typography/primary_heading.dart';
import 'package:mock_flutter_app/src/widgets/global/clipper/wave_clipper.dart';

import '../../../widgets/global/controls/elevated_btn.dart';
import '../../../widgets/global/controls/form_field.dart';
import '../models/single_product_model.dart';

class EditScreen extends StatefulWidget {
  EditScreen({Key? key, required this.singleProductModel}) : super(key: key);
  SingleProductModel singleProductModel;

  @override
  State<EditScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<EditScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProductService _productService = ProductService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _stockCountController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  String? Validator(value) {
    if (value!.isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }

  void onFormsubmit() {
    if (_formKey.currentState!.validate()) {
      widget.singleProductModel.name = _nameController.text;
      widget.singleProductModel.price = _priceController.text as double;
      widget.singleProductModel.noInStock = _stockCountController.text as int;
      _productService.UpdateProductList(widget.singleProductModel, context);
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
                  headingText: "Edit Item", verticalPadding: 20),
              Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CustomFormField(
                            formFieldController: _nameController,
                            controlLabel: "Product Name",
                            controlIcon: const Icon(Icons.edit),
                            validator: Validator),
                        CustomFormField(
                            formFieldController: _priceController,
                            controlLabel: "Product Price",
                            controlIcon: const Icon(Icons.attach_money_rounded),
                            validator: Validator),
                        CustomFormField(
                            formFieldController: _stockCountController,
                            controlLabel: "Product Stock",
                            controlIcon:
                                const Icon(Icons.production_quantity_limits),
                            validator: Validator),
                        Styles.SizedBoxH20,
                        Styles.SizedBoxH40,
                        CustomElevatedButton(
                            btnText: "Done",
                            verticalPadding: 13,
                            onPressed: onFormsubmit),
                        Styles.SizedBoxH40,
                      ]))
            ],
          ),
        )
      ]),
    );
  }
}
