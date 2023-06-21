import 'package:flutter/material.dart';
import 'package:graduation/components/appBar/reusablseAppBar.dart';
import 'package:graduation/screens/drawer_screens/screens/share_app_screen.dart';

import 'help_and_support_screen.dart';


class GeneralScreen extends StatelessWidget {
  const GeneralScreen({Key? key}) : super(key: key);
  static String generalScreenRoute = 'general screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 2.0,
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: defBlue,
      //       size: 30.0,
      //     ),
      //   ),
      //   title: Text(
      //     'General',
      //       style: TextStyle(
      //       color: defBlue,
      //       fontWeight: FontWeight.bold,
      //       fontSize: MediaQuery.of(context).size.width / 12.5,
      //     ),
      //
      //   ),
      // ),
      appBar: ReusableAppBar(
        leadingFunction: () {
          Navigator.pop(context);
        },
        title: 'Data Backup',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 7.0,
          ),
          child: Column(
            children: [
              ShareAppScreen(),
              HelpAndSupportScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
