//CustomExpiredReport
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomItemReportShowData extends StatelessWidget {
  const CustomItemReportShowData({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.valueData,
    //required this.onPressed,
  }) : super(key: key);
  final String leading;
  final String title;
  final String subtitle;
  final String valueData;
  //final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 1.9,
        horizontal: 0.0,
      ),
      child: Card(
        elevation: 1.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: SizedBox(
                width: 65,
                height: 65,
                child: Image.network(
                  leading,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                title,
                 style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: defIndigo,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 18.0,
                  color: defDeepPurple,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  valueData,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: defIndigo,
                    ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
