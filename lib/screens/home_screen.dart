import 'package:flutter/material.dart';
import 'navbar_screens/main_nav_screen.dart';
import 'navbar_screens/orders_screen.dart';
import 'navbar_screens/shopping_cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String homeScreenRoute = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 1;
  List<Widget> screens = [
    OrdersScreen(),
    MainScreen(),
    ShoppingCartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[currentIndex],
     
          
            
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: 'Shopping Cart',
          ),
        ],
      ),
    );
  }
}
