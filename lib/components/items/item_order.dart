import 'package:flutter/material.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/constants/colors.dart';

class item_order extends StatelessWidget {
  item_order(
      {required this.name, required this.image, required this.productOrderId});
  String name;
  String image;
  int productOrderId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      child: Container(
        width: 0,
        height: 133.8,
        decoration: BoxDecoration(
          color: Color(0xFFFEFCFF),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(40),
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.white12),
        ),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(-0.85, -0.25),
              child: Image.network(
                image,
                // assets/images/istockphoto-1072626580-612x612.jpg
                width: 108.3,
                height: 91.7,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.06, -0.59),
              child: Text(
                name, // Processing
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: defDeepPurple,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.8, -0.35),
              child: Text(
                'To day',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: defLightBlue,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.20, 0.6),
              //alignment: AlignmentDirectional.bottomCenter,
              child: Text(
                'Order ID :',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: defBlue,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.30, 0.62),
              child: Text(
                '$productOrderId',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: defBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
