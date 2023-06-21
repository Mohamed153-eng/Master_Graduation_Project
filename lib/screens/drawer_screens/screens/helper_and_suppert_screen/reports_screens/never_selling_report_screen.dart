import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../../components/appBar/reusablseAppBar.dart';
import '../../../../../components/items/custom_item_report_show_data.dart';
import 'main_reports_screen.dart';

class neverSalesProduct {
  final String name;
  final dynamic price;
  final String image;
  final int stock;

  neverSalesProduct({
    required this.name,
    required this.price,
    required this.image,
    required this.stock,
  });

  factory neverSalesProduct.fromJson(Map<String, dynamic> json) {
    return neverSalesProduct(
      name: json['pro_name'],
      price: json['price'].toInt(),
      image: json['image'],
      stock: json['stock'],
    );
  }
}

Future<Map<String, dynamic>> fetchData() async {
  final response = await http
      .get(Uri.parse('http://185.132.55.54:8000/lowestsellingproduts/'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

List<neverSalesProduct> parseProducts(dynamic responseBody) {
  final parsed =
      responseBody['data']['products_not_sold'].cast<Map<String, dynamic>>();
  return parsed
      .map<neverSalesProduct>((json) => neverSalesProduct.fromJson(json))
      .toList();
}

class NeverSellingReportScreen extends StatefulWidget {
  static String neverSellingReportScreenRoute = 'never selling report screen';
  @override
  _NeverSellingReportScreenState createState() =>
      _NeverSellingReportScreenState();
}

class _NeverSellingReportScreenState extends State<NeverSellingReportScreen> {
  late Future<Map<String, dynamic>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        leadingFunction: () {
          Navigator.pushNamedAndRemoveUntil(context,
              MainReportsScreen.mainReportsScreenRoute, (route) => false);
        },
        title: 'Never Selling',
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final neverSalesProducts = parseProducts(snapshot.data!);
            //final lowSalesProducts = parseLowSalesProducts(snapshot.data!);
            return ListView.builder(
                shrinkWrap: true,
                itemCount: neverSalesProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomItemReportShowData(
                    leading: neverSalesProducts[index].image,
                    subtitle:
                        '\$ ${neverSalesProducts[index].price}'.toString(),
                    title: neverSalesProducts[index].name,
                    valueData: '${neverSalesProducts[index].stock} In Stock'
                        .toString(),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading low selling products'),
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
