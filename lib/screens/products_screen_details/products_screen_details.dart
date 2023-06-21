import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation/components/appBar/reusablseAppBar.dart';
import 'package:graduation/constants/colors.dart';
import 'package:provider/provider.dart';
import '../../components/text/text_button.dart';
import '../../models/data_product_model.dart';
import '../../models/model_provider.dart';
import '../home_screen.dart';
import '../navbar_screens/shopping_cart_screen.dart';
import 'package:http/http.dart' as http;

class ProductsScreenDetails extends StatefulWidget {
  static const String productsDetailsScreenRoute = 'products details screen';
  final DataProductModel detailsProduct;
  final int productState;

  const ProductsScreenDetails({
    Key? key,
     required this.detailsProduct,
    required this.productState,
  }) : super(key: key);

  @override
  State<ProductsScreenDetails> createState() => _ProductsScreenDetailsState();





}

class _ProductsScreenDetailsState extends State<ProductsScreenDetails> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProvider>(builder: ((context, classInstance, child) {
      return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 2.0,
        //   leading: IconButton(
        //     onPressed: () {
        //       Navigator.pushNamedAndRemoveUntil(
        //           context, HomeScreen.homeScreenRoute, (route) => false);
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       color: defBlue,
        //       size: 35.0,
        //     ),
        //   ),
        //   title: Text(
        //     'Pharmacy',
        //     style: TextStyle(
        //       color: defBlue,
        //       fontWeight: FontWeight.bold,
        //       fontSize: MediaQuery.of(context).size.width / 12.5,
        //     ),
        //   ),
        //   actions: [
        //     Stack(
        //       children: [
        //         Positioned(
        //           bottom: 22,
        //           child: Container(
        //               padding: const EdgeInsets.all(5),
        //               decoration: const BoxDecoration(
        //                   color: Colors.cyan, shape: BoxShape.circle),
        //               child: Text(
        //                 '${classInstance.itemModelLength}',
        //                 //selectedProduct.length
        //                 style: const TextStyle(
        //                     fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),
        //               )),
        //         ),
        //         IconButton(
        //           onPressed: () {
        //             Navigator.pushNamedAndRemoveUntil(context,
        //                 ShoppingCartScreen.shoppingCartRoute, (route) => false);
        //           },
        //           icon: Icon(
        //             Icons.shopping_cart,
        //             color: defBlue,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        appBar: ReusableAppBar(
            leadingFunction: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.homeScreenRoute, (route) => false);
            },
            title: 'Details Product',
          action: <Widget>[
                Stack(
                  children: [
                    Positioned(
                      bottom: 22,
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Colors.cyan, shape: BoxShape.circle),
                          child: Text(
                            '${classInstance.itemModelLength}',
                            //selectedProduct.length
                            style: const TextStyle(
                                fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),
                          )),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            ShoppingCartScreen.shoppingCartRoute, (route) => false);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: defBlue,
                      ),
                    ),
                  ],
                ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageView.builder(
            itemBuilder: (BuildContext context, int index) {

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: Image.network(
                    //'assets/images/panadol.jpg',
                    widget.detailsProduct.productImage,
                    height: 300, // change
                  )),
                  Row(
                    children: [
                      Text(
                        // 'Panadol',
                        widget.detailsProduct.productName,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Row(
                    children: [
                      Text(
                        'Price: ',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 20,
                          fontWeight: FontWeight.w600,
                          color: defBlue,
                        ),
                      ),
                      Text(
                        //'35.00',
                        '\$ ${widget.detailsProduct.productPrice.toString()}',
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          widget.detailsProduct.productDescription,
                          maxLines: isShowMore ? 2 : null,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isShowMore = !isShowMore;
                          });
                        },
                        child: Text(
                          isShowMore ? 'show more' : 'show less',
                          style: const TextStyle(
                              fontSize: 17.5, color: Colors.lightBlue),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Visibility(
                        visible: widget.productState >= 1,
                        child: ReusableTextButton(
                          color: defBlue,
                          onPressed: () {
                            classInstance.add(widget.detailsProduct);
                          },
                          text: 'Add To Cart',
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      );
    }));
  }
}
