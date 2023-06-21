import 'package:flutter/material.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/constants/colors.dart';
class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);
  final String leading;
  final String title;
  final String subtitle;
  final String textButton;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 1.5,
        horizontal: 0.0,
      ),
      child: Card(
        elevation: 1.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             ListTile(
              leading: Image.asset(
                  leading
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
                TextButton(
                  child:  Text(
                    textButton,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: defIndigo,
                    ),
                  ),
                  onPressed: onPressed,
                  
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
