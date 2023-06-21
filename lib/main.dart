import 'package:flutter/material.dart';
import 'package:graduation/screens/drawer_screens/screens/about_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/date_bake_up_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/helper_and_suppert_screen/general_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/helper_and_suppert_screen/help_and_support_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/helper_and_suppert_screen/reports_screens/available_stock_reports_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/helper_and_suppert_screen/reports_screens/best_selling_report_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/helper_and_suppert_screen/reports_screens/expired_products_reports_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/helper_and_suppert_screen/reports_screens/lowest_selling_report_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/helper_and_suppert_screen/reports_screens/never_selling_report_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/helper_and_suppert_screen/reports_screens/safty_limit_report_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/rate_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/helper_and_suppert_screen/reports_screens/main_reports_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/share_app_screen.dart';
import 'package:graduation/screens/drawer_screens/screens/user_information_screen.dart';
import 'package:graduation/screens/home_screen.dart';
import 'package:graduation/screens/introduction_screen/introduction_screen.dart';
import 'package:graduation/screens/navbar_screens/invoice_screen.dart';
import 'package:graduation/screens/navbar_screens/main_nav_screen.dart';
import 'package:graduation/screens/navbar_screens/orders_screen.dart';
import 'package:graduation/screens/navbar_screens/shopping_cart_screen.dart';
import 'package:graduation/screens/sign_screens/forget_screen.dart';
import 'package:graduation/screens/sign_screens/forgotten_password_screen.dart';
import 'package:graduation/screens/sign_screens/login_screen.dart';
import 'package:graduation/screens/sign_screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'models/model_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (BuildContext context) => ModelProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(), //IntroScreen(),
        routes: {
          IntroScreen.introductionScreenRoute: (context) => IntroScreen(),
          LoginScreen.loginScreenRoute: (context) => LoginScreen(),
          RegisterScreen.registerScreenRoute: (context) => RegisterScreen(),
          ForgetScreen.forgetScreenRoute: (context) => ForgetScreen(),
          ForgottenPasswordScreen.forgottenPasswordScreenRoute: (context) =>
              ForgottenPasswordScreen(),
          HomeScreen.homeScreenRoute: (context) => const HomeScreen(),
          MainScreen.mainScreenRoute: (context) => MainScreen(),
          ShoppingCartScreen.shoppingCartRoute: (context) =>
               ShoppingCartScreen(),
          OrdersScreen.ordersScreenRoute: (context) => const OrdersScreen(),
          /*ProductsScreenDetails.productsDetailsScreenRoute: (context) =>
               ProductsScreenDetails(),*/
          GeneralScreen.generalScreenRoute: (context) => const GeneralScreen(),
          Admin_panal.admin_panelRoute: (context) =>
              const Admin_panal(),
          MainReportsScreen.mainReportsScreenRoute: (context) =>
              MainReportsScreen(),
          AboutScreen.aboutScreenRoute: (context) => const AboutScreen(),
          // SettingsScreen.settingsScreenRoute: (context) =>
          //     const SettingsScreen(),
          ShareAppScreen.shareAppScreenRoute: (context) =>
              const ShareAppScreen(),
          HelpAndSupportScreen.helpAndSupportScreenRoute: (context) =>
              const HelpAndSupportScreen(),
          RateScreen.rateScreenRoute: (context) => const RateScreen(),
          InvoiceScreen.invoiceScreenRoute: (context) => const InvoiceScreen(),
          UserInformationScreen.userInformationScreenRoute: (context) =>
               UserInformationScreen(),
          BestSellingReportScreen.bestSellingReportScreenRoute: (context) =>
              BestSellingReportScreen(),
          LowestSellingReportScreen.lowestSellingReportScreenRoute: (context) =>
              LowestSellingReportScreen(),
          NeverSellingReportScreen.neverSellingReportScreenRoute: (context) =>
              NeverSellingReportScreen(),
          SaftyLimitReportScreen.saftyLimitReportScreenRoute: (context) =>
              SaftyLimitReportScreen(),
          AvailableStockReportScreen.availableStockReportScreenRoute:
              (context) => AvailableStockReportScreen(),
          ExpiredProductsReportsScreen.expiredProductsReportScreenRoute:
              (context) => ExpiredProductsReportsScreen(),
        },
      ),
    );
  }
}
