import 'package:flutter/material.dart';
import 'package:mock_flutter_app/src/constants/colors.dart';
import 'package:mock_flutter_app/src/constants/styles.dart';
import 'package:mock_flutter_app/src/features/products/services/product_service.dart';
import 'package:mock_flutter_app/src/navigation/route_names.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductService _productService = new ProductService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productService.getProductsList();
  }

  @override
  Widget build(BuildContext context) {
    var productModel =
        Provider.of<ProductService>(context, listen: true).productsModel;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Container(
        height: height,
        child: Stack(
          children: [
            SizedBox(
              height: 240,
              child: Stack(children: [
                Positioned(
                    child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/background.png"))),
                )),
                Positioned(
                    left: 0,
                    right: -2,
                    bottom: 0,
                    child: Container(
                      height: 80,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/curve.png"))),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        "Payment Summary",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      ListTile(
                        title: Text(
                          "Products Count",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        subtitle: Text(
                          "${productModel.productCount}",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Average Price",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        subtitle: Text(
                          "${productModel.averageProductsPrice}",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
            Positioned(
                right: 50,
                bottom: 0,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/lines.png")),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(0, 1),
                            color: AppColors.boxShadowColor)
                      ]),
                )),
            Positioned(
              height: 200,
              width: 400,
              top: 250,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search for items in the store",
                      suffixIcon: Icon(Icons.search),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      filled: true,
                      fillColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(40))),
                ),
              ),
            ),
            Positioned(
                height: MediaQuery.of(context).size.height,
                width: 330,
                top: 200,
                child: ListView.separated(
                    itemCount: productModel.products.length,
                    separatorBuilder: (context, value) {
                      return Styles.SizedBoxH20;
                    },
                    itemBuilder: ((context, index) {
                      return Container(
                        height: 130,
                        width: 330,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Wrap(
                                      direction: Axis.vertical,
                                      alignment: WrapAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.end,
                                      spacing: 40,
                                      runSpacing: 40,
                                      children: [
                                        Row(
                                          children: [
                                            ClipPath(
                                              child: Image(
                                                  height: 50,
                                                  width: 50,
                                                  image: AssetImage(
                                                      "assets/images/lines.png")),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Column(
                                                children: [
                                                  Text(productModel
                                                      .products[index].name),
                                                  Text(
                                                      "ID:${productModel.products[index].id}")
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                            "${productModel.products[index].isAvailable}"),
                                      ],
                                    )
                                  ],
                                ),
                                Flex(
                                  direction: Axis.vertical,
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {
                                        _productService.UpdateProductList(
                                            productModel.products[index],
                                            context);
                                        Navigator.pushNamed(
                                            context, RouteName.editProduct);
                                      },
                                      child: Text("Edit",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      style: OutlinedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          backgroundColor:
                                              AppColors.ACCENT_COLOR,
                                          shape: StadiumBorder()),
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        _productService.DeleteProduct(
                                            productModel.products[index].id);
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          backgroundColor:
                                              AppColors.ACCENT_COLOR,
                                          shape: StadiumBorder()),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 15,
                                  spreadRadius: 10,
                                  offset: const Offset(1, 1),
                                  color: AppColors.boxShadowColor)
                            ]),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
