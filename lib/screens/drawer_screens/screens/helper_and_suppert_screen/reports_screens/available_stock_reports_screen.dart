//AvailableStockReportsScreen
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../components/appBar/reusablseAppBar.dart';
import '../../../../../components/items/custom_item_report_show_data.dart';
import 'main_reports_screen.dart';

class AvailableStockProduct {
  String proName;
  String productCode;
  String image;
  int stock;
  String expDate;

  AvailableStockProduct({
    required this.proName,
    required this.productCode,
    required this.image,
    required this.stock,
    required this.expDate,
  });

  factory AvailableStockProduct.fromJson(Map<String, dynamic> json) {
    return AvailableStockProduct(
      proName: json['pro_name'],
      productCode: json['product_code'],
      image: 'http://185.132.55.54:8000/${json['image']}',
      stock: json['stock'],
      expDate: json['exp_date'],
    );
  }
}

class ApiService {
  static const String apiUrl = 'http://185.132.55.54:8000/avilablestock/';

  static Future<List<AvailableStockProduct>> getAvailableStockProduct() async {
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> productsJson = data['in_stock_products'];
      return productsJson
          .map((productJson) => AvailableStockProduct.fromJson(productJson))
          .toList();
    } else {
      throw Exception('Failed to load expired products');
    }
  }
}

class AvailableStockReportScreen extends StatefulWidget {
  static String availableStockReportScreenRoute =
      'available stock report screen';

  @override
  _AvailableStockReportScreenState createState() =>
      _AvailableStockReportScreenState();
}

class _AvailableStockReportScreenState
    extends State<AvailableStockReportScreen> {
  late Future<List<AvailableStockProduct>> _expiredProductsFuture;

  @override
  void initState() {
    super.initState();
    _expiredProductsFuture = ApiService.getAvailableStockProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        leadingFunction: () {
          Navigator.pushNamedAndRemoveUntil(context,
              MainReportsScreen.mainReportsScreenRoute, (route) => false);
        },
        title: 'Available Stock',
      ),
      body: FutureBuilder<List<AvailableStockProduct>>(
        future: _expiredProductsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AvailableStockProduct> expiredProducts = snapshot.data!;
            return ListView.builder(
              itemCount: expiredProducts.length,
              itemBuilder: (context, index) {
                AvailableStockProduct product = expiredProducts[index];
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
