import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation/constants/colors.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);
  static String helpAndSupportScreenRoute = 'help and support screen';
  final String line1 = 'Email: Pharmacy@example.com';
  final String line2 = 'Phone: 012223334445';
  final String textToCopy1 = 'Pharmacy@example.com';
  final String textToCopy2 = '012223334445';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ListTile(
            leading: Icon(
              Icons.email_sharp,
              color: defIndigo,
            ),
            title: Text(
              'Help and Support  ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: defIndigo,
              ),
            ),
            subtitle: Text(
              'Are you facing some problems in the application.',
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
                child: const Text(
                  'Contact us !',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: defIndigo,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'To report problems and technical support, contact us',
                              style: TextStyle(
                                color: defIndigo,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Image(
                              image: AssetImage('assets/images/agent2.png'),
                              height: 100,
                              width: 100,
                            ),
                            Row(
                              children: [
                                SelectableText(
                                  line1,
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Clipboard.setData(
                                          ClipboardData(text: textToCopy1));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Text copied to clipboard!'),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.copy,
                                      size: 22,
                                      color: Colors.grey,
                                    ))
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              children: [
                                SelectableText(
                                  line2,
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Clipboard.setData(
                                          ClipboardData(text: textToCopy2));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Text copied to clipboard!'),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.copy,
                                      size: 22,
                                      color: Colors.grey,
                                    ))
                              ],
                            ),
                            SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(
                                    context); // close the bottom sheet
                              },
                              child: Text('Close'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: defIndigo,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
