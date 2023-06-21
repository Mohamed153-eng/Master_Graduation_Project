import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/screens/drawer_screens/main_drawer.dart';
import '../../models/data_product_model.dart';
import '../../services/get_all_products_services.dart';
import '../products_screen_details/products_screen_details.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  static const String mainScreenRoute = 'main screen';
  @override
  State<MainScreen> createState() => _MainScreenState();


}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController searchController = TextEditingController();
  List<DataProductModel> allProducts = [];
  List<DataProductModel> foundProducts = [];
  @override
  void initState() {
    super.initState();
    fetchProducts();

  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('http://185.132.55.54:8000/products/'));
    final jsonData = json.decode(response.body);
    allProducts = jsonData
        .map<DataProductModel>((product) => DataProductModel(
              productId: product["id"],
              productName: product["pro_name"],
              productPrice: product["price"],
              productDescription: product["description"],
              productImage: product["image"],
             productState: product["stock"],
            ))
        .toList();
    setState(() {
      foundProducts = allProducts;
    });
  }

  void _runFilter(String enteredKeyword) {
    List<DataProductModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = allProducts;
    } else {
      results = allProducts
          .where((product) => product.productName
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(
              Icons.menu,
              color: defBlue,
              size: MediaQuery.of(context).size.width / 12.5,
            ),
          ),
        ),
        title: Text(
          'Pharmacy',
          style: TextStyle(
            color: defBlue,
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width / 12.5,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(7.5),
            child: Image.asset('assets/images/image1.png'),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 13.0,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: TextFormField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[300],
                  filled: true,
                  hintText: 'Search For Medicine',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Container(
                height: MediaQuery.of(context).size.height / 1.42,
                child: FutureBuilder<List<DataProductModel>>(
                    future: AllProductsServices().getAllProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 1.42,
                          child: GridView.builder(
                            padding: EdgeInsets.all(10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 30.0,
                              crossAxisSpacing: 35.0,
                              crossAxisCount: 2,
                              childAspectRatio: 2.5 / 2.7, // changed
                            ),
                            itemCount: foundProducts.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductsScreenDetails(
                                        detailsProduct: foundProducts[index],
                                            productState: foundProducts[index].productState,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                9,
                                            child: Image.network(
                                              foundProducts[index].productImage,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 13,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              foundProducts[index].productName,
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    22,
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
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            23.0,
                                                    color: defBlue,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  foundProducts[index]
                                                      .productPrice
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            23.0,
                                                    color: defLightBlue,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 2,),
                                            Text(
                                              ' ${foundProducts[index].productState.toString()} In stock',
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width / 25.0,
                                                color: foundProducts[index].productState < 1 ? Colors.red : defIndigo,
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
                          ),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
          ],
        ),
      ),
    );

  }

}
