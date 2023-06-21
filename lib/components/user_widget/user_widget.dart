import 'package:flutter/material.dart';

Widget userWidget({
  required String requiredInformation,
  required String userInformation,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$requiredInformation:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.green[700],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                userInformation,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
      Divider(
        thickness: 0.3,
        color: Colors.black,
      ),
    ],
  );
}
