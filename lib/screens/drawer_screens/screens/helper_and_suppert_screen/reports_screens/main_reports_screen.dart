import 'package:flutter/material.dart';
import 'package:graduation/components/appBar/reusablseAppBar.dart';
import 'package:graduation/components/items/item_card.dart';
import 'package:graduation/constants/colors.dart';
import 'package:graduation/screens/drawer_screens/screens/helper_and_suppert_screen/reports_screens/safty_limit_report_screen.dart';
import 'package:graduation/screens/home_screen.dart';
import 'available_stock_reports_screen.dart';
import 'best_selling_report_screen.dart';
import 'expired_products_reports_screen.dart';
import 'lowest_selling_report_screen.dart';
import 'never_selling_report_screen.dart';

class MainReportsScreen extends StatelessWidget {
  MainReportsScreen({super.key});
  static String mainReportsScreenRoute = 'reports screen';
  String textButton = 'Take a Report !';
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
      //     'Reports',
      //     style: TextStyle(
      //       color: defBlue,
      //       fontWeight: FontWeight.bold,
      //       fontSize: MediaQuery.of(context).size.width / 12.5,
      //     ),
      //   ),
      // ),
      appBar: ReusableAppBar(
        leadingFunction: () {
          Navigator.pop(context);
        },
        title: 'Reports',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 0.0,
          ),
          child: Column(
            children: [
              ItemCard(
                leading: 'assets/reports_icon/report.png',
                title: 'Best Selling Products',
                subtitle: 'This Report For Best Selling Products',
                textButton: textButton,
                onPressed: () {
                  Navigator.pushNamed(context,
                      BestSellingReportScreen.bestSellingReportScreenRoute);
                },
              ),
              ItemCard(
                leading: 'assets/reports_icon/loss.png',
                title: 'Lowest Selling Products',
                subtitle: 'This Report For Lowest Selling Products',
                textButton: textButton,
                onPressed: () {
                  Navigator.pushNamed(context,
                      LowestSellingReportScreen.lowestSellingReportScreenRoute);
                },
              ),
              ItemCard(
                leading: 'assets/reports_icon/inventory.png',
                title: 'Products Never Selling',
                subtitle: 'This Report For Products Never Selling',
                textButton: textButton,
                onPressed: () {
                  Navigator.pushNamed(context,
                      NeverSellingReportScreen.neverSellingReportScreenRoute);
                },
              ),
              ItemCard(
                leading: 'assets/reports_icon/expiry.png',
                title: 'Products Expiry In Stock',
                subtitle: 'This Report For Products Expiry In Stock',
                textButton: textButton,
                onPressed: () {
                  Navigator.pushNamed(
                      context, ExpiredProductsReportsScreen.expiredProductsReportScreenRoute);
                },
              ),
              ItemCard(
                leading: 'assets/reports_icon/product.png',
                title: 'Safety Limit For Products',
                subtitle: 'This Report For Safety Limit For Products',
                textButton: textButton,
                onPressed: () {
                  Navigator.pushNamed(
                      context, SaftyLimitReportScreen.saftyLimitReportScreenRoute);
                },
              ),
              ItemCard(
                leading: 'assets/reports_icon/ready-stock.png',
                title: 'Products Available Stock',
                subtitle: 'This Report For Products Available Stock',
                textButton: textButton,
                onPressed: () {
                  Navigator.pushNamed(
                      context, AvailableStockReportScreen.availableStockReportScreenRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}






/*
import 'package:flutter/material.dart';

import '../../../components/items/item_reports.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);
  static String reportsScreenRoute = 'reports screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: defBlue,
            size: 30.0,
          ),
        ),
        title: Text(
          'Reports',
          style: TextStyle(
            color: defBlue,
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width / 12.5,
          ),

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 60,
        ),
        child: GridView.count(
          padding: EdgeInsets.only(
            left: 30.0,
          ),
          mainAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: [
            ItemReports(
              description: 'Lowest Selling Products',
              image: 'assets/reports_images/Low.jpeg',
            ),

            ItemReports(
              description: 'Best Selling Products',
              image: 'assets/reports_images/Best.png',
            ),

            ItemReports(
              description: 'Products Expiry In Stock', //Products Expiry
              image: 'assets/reports_images/Expiry.webp',
            ),

            ItemReports(
              description: 'Safety Limit For Products',
              image: 'assets/reports_images/Safety Limit.png',
            ),

            ItemReports(
              description: 'Products Available Stock',
              image: 'assets/reports_images/Stock.png',
            ),

            ItemReports(
              description: 'Inventory For Products',
              image: 'assets/reports_images/Inventory.png',
            ),
          ],
        ),
      ),
    );
  }
}


/*
 Row(
              children: [
                Container(
                  height: 180.0,
                  width: 160.0,
                  color: Colors.cyan,
                  padding: EdgeInsets.symmetric(
                    /*vertical: 15,
                    horizontal: 11.0*/

                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 5.0,),
                      Expanded(
                        child: Container(
                          child: Image.asset(
                            'assets/reports_images/Low.jpeg',
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0
                        ),
                        child: Text(
                          'Lowest Selling Producets',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      // SizedBox(height: 2.0,),
                      ElevatedButton(
                        onPressed: (){},
                        child: Text(
                            'Take a Report'
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
 */
 */