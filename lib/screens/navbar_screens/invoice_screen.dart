import 'package:flutter/material.dart';
import 'package:graduation/components/appBar/reusablseAppBar.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/screens/navbar_screens/orders_screen.dart';
import 'package:graduation/screens/navbar_screens/shopping_cart_screen.dart';
import 'package:provider/provider.dart';
import '../../components/items/custom_item_invoice.dart';
import '../../components/text/text_button.dart';
import '../../models/model_provider.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({Key? key}) : super(key: key);
  static String invoiceScreenRoute = 'invoice screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProvider>(
      builder: ((context, classInstance, child) {
        return Scaffold(
          appBar: ReusableAppBar(
            leadingFunction: () {
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  ShoppingCartScreen.shoppingCartRoute,
                      (route) => false);
            },
            title: 'Invoice',
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    'Invoice Items',
                    textScaleFactor: 1.5,
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    height: 20.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: classInstance.selectedProduct.length,
                      itemBuilder: (context, int index) {
                        final product = classInstance.selectedProduct[index];
                        return CustomItemInvoice(
                          titleName: product.productName.toString(),
                          trailingPrice: '\$${product.productPrice.toStringAsFixed(2)}',
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 6.0,
                      bottom: 0.0,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total :',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                '\$${classInstance.totalPriceAllProducts.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        ReusableTextButton(
                          color: defBlue,
                          onPressed: () {
                            classInstance.moveToOrderScreen();
                            classInstance.removeItemOfList();
                            Navigator.pushNamed(
                              context,
                              OrdersScreen.ordersScreenRoute,
                            );
                          },
                          text: 'OrderNow',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
