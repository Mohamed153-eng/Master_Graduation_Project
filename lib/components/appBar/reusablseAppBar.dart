import 'package:flutter/material.dart';
import 'package:graduation/constants/colors.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  ReusableAppBar({
    Key? key,
    required this.leadingFunction,
    required this.title,
    this.action,
  }) : super(key: key);
  Function leadingFunction;
  String title;
  List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2.0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          leadingFunction();
        },
        icon: Icon(Icons.arrow_back_ios, color: defIndigo, size: 30.0,),
      ),
      title: Text(
        title as String,
        style: TextStyle(
          color: defBlue,
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.width / 12.5,
        ),
      ),
      actions: action,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(
    double.maxFinite,
    60,
  );


}
