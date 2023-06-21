import 'package:flutter/material.dart';
import 'package:graduation/constants/colors.dart';

class Developers extends StatelessWidget {
  Developers({
    Key? key,
    required this.image,
    required this.name,
    required this.jopName,
  }) : super(key: key);
  String image;
  String name;
  String jopName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 275,
          child: Image.asset(image),
        ),
        SizedBox(
          height: 5.0,
        ),
        Column(
          children: [
            Text(
              '* $name *',
              style: TextStyle(
                fontSize: 27.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              jopName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: defBlue,
              ),
            ),
            Divider(
              height: 20.0,
              thickness: 3,
              color: Colors.black26,
            ),
          ],
        ),
      ],
    );
  }
}
