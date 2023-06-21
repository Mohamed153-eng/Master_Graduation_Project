import 'package:flutter/material.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/models/model_provider.dart';
import 'package:graduation/screens/drawer_screens/screens/about_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/date_bake_up_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/helper_and_suppert_screen/general_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/rate_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/helper_and_suppert_screen/reports_screens/main_reports_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/user_information_screen.dart';
import 'package:graduation/screens/sign_screens/login_screen.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/medicine2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              iconColor: defBlue,
              leading: Icon(Icons.account_tree_outlined),
              title: Text(
                'General',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: defDeepPurple,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, GeneralScreen.generalScreenRoute);
              },
            ),
            Divider(
              height: 15.0,
              thickness: 0.7,
            ),
            ListTile(
              iconColor: defBlue,
              leading: Icon(Icons.cloud_sync_outlined),
              title: Text(
                'Admin panel',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: defDeepPurple,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(
                    context, Admin_panal.admin_panelRoute);
              },
            ),
            Divider(
              height: 15.0,
              thickness: 0.7,
            ),
            ListTile(
              iconColor: defBlue,
              leading: Icon(Icons.receipt_long_outlined),
              title: Text(
                'Reports',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: defDeepPurple,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(
                    context, MainReportsScreen.mainReportsScreenRoute);
              },
            ),

            /* // This Is Settings Screen (M.Ahmed)
            Divider(
              height: 15.0,
              thickness: 0.7,
            ),
            ListTile(
              iconColor: Colors.lightBlue[900]!,
              leading: Icon(Icons.settings_outlined),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: defDeepPurple,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(
                    context, SettingsScreen.settingsScreenRoute);
              },
            ),*/

            Divider(
              height: 15.0,
              thickness: 0.7,
            ),
            ListTile(
              iconColor: defBlue,
              leading: Icon(Icons.star_rate_outlined),
              title: Text(
                'Rate',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: defDeepPurple,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, RateScreen.rateScreenRoute);
              },
            ),
            Divider(
              height: 15.0,
              thickness: 0.7,
            ),
            Consumer<ModelProvider>(builder: (context, classInstance, child){
              return ListTile(
                iconColor: defBlue,
                leading: Icon(Icons.person_outline),
                title: Text(
                  'User',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: defDeepPurple,
                  ),
                ),
                onTap: () async{
                  Navigator.pushNamed(
                      context, UserInformationScreen.userInformationScreenRoute);
                },
              );
            },),
            Divider(
              height: 15.0,
              thickness: 0.7,
            ),
            ListTile(
              iconColor: defBlue,
              leading: Icon(Icons.important_devices_outlined),
              title: Text(
                'About',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: defDeepPurple,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, AboutScreen.aboutScreenRoute);
              },
            ),
            Divider(
              height: 15.0,
              thickness: 0.7,
            ),
            ListTile(
              iconColor: defBlue,
              leading: Icon(Icons.logout_outlined),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: defDeepPurple,
                ),
              ),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.loginScreenRoute, (route) => false);
              },
            ),
            Divider(
              height: 15.0,
              thickness: 0.7,
            ),
          ],
        ),
      ),
    );
  }
}
