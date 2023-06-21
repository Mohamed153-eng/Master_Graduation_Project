import 'package:flutter/material.dart';
//import 'package:share_plus/share_plus.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/constants/colors.dart';

class ShareAppScreen extends StatelessWidget {
  const ShareAppScreen({Key? key}) : super(key: key);
  static String shareAppScreenRoute = 'share app screen';
  Future<void> share() async {
    await FlutterShare.share(
      title: 'Pharmacy Application',
      linkUrl: 'https://flutter.dev/',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ListTile(
            leading: Icon(
              Icons.share,
              color: defIndigo,
            ),
            title: Text(
              'Share The Application ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: defIndigo,
              ),
            ),
            subtitle: Text(
              'You can share the application by sending the link.',
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
                onPressed: share,
                child: const Text(
                  'Share Now !',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: defIndigo,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
