//SaftyLimitReportScreen

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../components/appBar/reusablseAppBar.dart';
import '../../../../../components/items/custom_item_report_show_data.dart';
import 'main_reports_screen.dart';

class SaftyLimitProduct {
  String proName;
  String productCode;
  String image;
  int stock;
  String expDate;

  SaftyLimitProduct({
    required this.proName,
    required this.productCode,
    required this.image,
    required this.stock,
    required this.expDate,
  });

  factory SaftyLimitProduct.fromJson(Map<String, dynamic> json) {
    return SaftyLimitProduct(
      proName: json['pro_name'],
      productCode: json['product_code'],
      image: 'http://185.132.55.54:8000/${json['image']}',
      stock: json['stock'],
      expDate: json['exp_date'],
    );
  }
}

class ApiService {
  static const String apiUrl = 'http://185.132.55.54:8000/stockreportact/';

  static Future<List<SaftyLimitProduct>> getSaftyLimitProduct() async {
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> productsJson = data['low_stock_products'];
      return productsJson
          .map((productJson) => SaftyLimitProduct.fromJson(productJson))
          .toList();
    } else {
      throw Exception('Failed to load expired products');
    }
  }
}

class SaftyLimitReportScreen extends StatefulWidget {
  static String saftyLimitReportScreenRoute = 'safty Limit report screen';
  @override
  _SaftyLimitReportScreenState createState() => _SaftyLimitReportScreenState();
}

class _SaftyLimitReportScreenState extends State<SaftyLimitReportScreen> {
  late Future<List<SaftyLimitProduct>> _expiredProductsFuture;

  @override
  void initState() {
    super.initState();
    _expiredProductsFuture = ApiService.getSaftyLimitProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        leadingFunction: () {
          Navigator.pushNamedAndRemoveUntil(context,
              MainReportsScreen.mainReportsScreenRoute, (route) => false);
        },
        title: 'Safty Limit',
      ),
      body: FutureBuilder<List<SaftyLimitProduct>>(
        future: _expiredProductsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<SaftyLimitProduct> expiredProducts = snapshot.data!;
            return ListView.builder(
              itemCount: expiredProducts.length,
              itemBuilder: (context, index) {
                SaftyLimitProduct product = expiredProducts[index];
                return CustomItemReportShowData(
                  leading: product.image,
                  subtitle:
                      'Expired In ${product.expDate}       Product Code ${product.productCode}',
                  title: product.proName,
                  valueData: '${product.stock} In Stock',
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading expired products'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
