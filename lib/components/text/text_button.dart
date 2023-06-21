import 'package:flutter/material.dart';

class ReusableTextButton extends StatelessWidget {
  ReusableTextButton({
    Key? key,
    required this.color,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  Color color;
  Function onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: 10.0,
      ),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
