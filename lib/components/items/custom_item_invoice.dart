import 'package:flutter/material.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/models/data_product_model.dart';
import 'package:graduation/models/model_provider.dart';
import 'package:provider/provider.dart';

class CustomItemInvoice extends StatelessWidget {
  CustomItemInvoice({
    Key? key,
    required this.titleName,
    required this.trailingPrice,
  }) : super(key: key);

  final String titleName;
  final String trailingPrice;

  double textScaleFactorForTitle = 1.4;
  double textScaleFactorForTrailing = 1.3;
  double textScaleFactorForSubtitle = 1.2;

  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<ModelProvider>(context);
    final product = modelProvider.selectedProduct.firstWhere(
          (item) => item.productName == titleName,
      orElse: () =>
          DataProductModel(), // Provide a default value if product is not found
    );

    return ListTile(
      title: Text(
        titleName,
        textScaleFactor: textScaleFactorForTitle,
        style: TextStyle(
          color: defDeepPurple,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        (product.productPrice * product.productQuantity).toString(),
        textScaleFactor: textScaleFactorForTrailing,
        style: TextStyle(
          color: defBlue,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      selected: true,
    );
  }
}
