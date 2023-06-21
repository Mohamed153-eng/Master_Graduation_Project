import 'package:flutter/material.dart';
import 'package:graduation/constants/colors.dart';

class CustomRowInvoiceProduct extends StatelessWidget {
  const CustomRowInvoiceProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: defIndigoAccent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 65.0,
            width: 60.0,
            margin: EdgeInsets.only(left: 5.0),
            child: Image.asset('assets/images/panadol.jpg'),
          ),
          Text(
            '10',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '200',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
