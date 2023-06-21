import 'package:flutter/material.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/models/model_provider.dart';
import 'package:provider/provider.dart';
import '../../models/data_product_model.dart';
import '../../screens/products_screen_details/products_screen_details.dart';
import '../../services/get_all_products_services.dart';

class ItemMedicine extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProvider>(builder: (context, classInstance, child) {
      return FutureBuilder<List<DataProductModel>>(
          future: AllProductsServices().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DataProductModel> products = snapshot.data!;
              return GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 30.0,
                  crossAxisSpacing: 35.0,
                  crossAxisCount: 2,
                  childAspectRatio: 2.5 / 2.7, // changed
                ),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      var foundProducts;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductsScreenDetails(
                            detailsProduct: products[index],
                            productState: foundProducts[index].productState,

                          ),
                        ),
                      );
                      //classInstance.add(items[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        //color: defDeepPurple[50],
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                            top: -5,
                            child: Padding(
                              padding: EdgeInsets.all(9),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 9,
                                child: Image.network(
                                  products[index].productImage,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 13,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  // name,//product.productName,
                                  products[index].productName,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 22,
                                    fontWeight: FontWeight.bold,
                                    color: defDeepPurple,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'price: ',
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                23.0,
                                        color: defBlue,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      // price,//product.productPrice as String,
                                      products[index].productPrice.toString(),
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                23.0,
                                        color: defLightBlue,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  //available,//product.productState,
                                  products[index].productState,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width /
                                            25.0,
                                    color: defIndigo,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          });
    });
  }
}
