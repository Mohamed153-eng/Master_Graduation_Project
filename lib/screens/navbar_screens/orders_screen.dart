import 'package:flutter/material.dart';
import 'package:graduation/components/appBar/reusablseAppBar.dart';
import 'package:graduation/components/items/item_order.dart';
import 'package:graduation/models/model_provider.dart';
import 'package:provider/provider.dart';
import '../home_screen.dart';
import '../products_screen_details/products_screen_details.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static String ordersScreenRoute = 'orders screen';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 2.0,
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pushNamedAndRemoveUntil(
      //           context, HomeScreen.homeScreenRoute, (route) => false);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: defBlue,
      //       size: 30.0,
      //     ),
      //   ),
      //   title: Text(
      //     'Orders',
      //     style: TextStyle(
      //       color: defBlue,
      //       fontWeight: FontWeight.bold,
      //       fontSize: MediaQuery.of(context).size.width / 12.5,
      //     ),
      //   ),
      // ),
      appBar: ReusableAppBar(
        leadingFunction: () {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.homeScreenRoute, (route) => false);
        },
        title: 'Orders',
      ),
      body: Consumer<ModelProvider>(
        builder: ((context, classInstance, child) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                // child: ListView.builder(
                //   padding: EdgeInsets.all(5.0),
                //   scrollDirection: Axis.vertical,
                //   itemCount: 10,
                //   itemBuilder: (BuildContext context, int index) {
                //     return GestureDetector(
                //       onTap: () {
                //         Navigator.pushNamedAndRemoveUntil(
                //             context,
                //             ProductsScreenDetails.productsDetailsScreenRoute,
                //             (route) => false);
                //       },
                //       child: item_order(),
                //     );
                //   },
                // ),
                child: ListView.builder(
                  //itemCount: classInstance.selectedProduct.length,
                  itemCount: classInstance.selectedProductOrders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            ProductsScreenDetails.productsDetailsScreenRoute,
                            (route) => false);
                      },
                      child: item_order(
                        name: classInstance
                            .selectedProductOrders[index].productName,
                        image: classInstance
                            .selectedProductOrders[index].productImage,
                            productOrderId: classInstance.generateRandomNumber(),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
