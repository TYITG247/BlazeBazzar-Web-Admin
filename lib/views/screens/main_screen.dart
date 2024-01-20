import 'package:blazebazzar_web_admin/views/screens/side_bar_screens/categories_screen.dart';
import 'package:blazebazzar_web_admin/views/screens/side_bar_screens/dashboard_screen.dart';
import 'package:blazebazzar_web_admin/views/screens/side_bar_screens/order_screen.dart';
import 'package:blazebazzar_web_admin/views/screens/side_bar_screens/product_screen.dart';
import 'package:blazebazzar_web_admin/views/screens/side_bar_screens/seller_screen.dart';
import 'package:blazebazzar_web_admin/views/screens/side_bar_screens/upload_banner.dart';
import 'package:blazebazzar_web_admin/views/screens/side_bar_screens/withdrawal_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedItem = DashBoardScreen();
  screenSelector(item) {
    switch (item.route) {
      case DashBoardScreen.routeName:
        setState(() {
          _selectedItem = DashBoardScreen();
        });
        break;
      case SellerScreen.routeName:
        setState(() {
          _selectedItem = SellerScreen();
        });
        break;
      case WithdrawalScreen.routeName:
        setState(() {
          _selectedItem = WithdrawalScreen();
        });
        break;
      case OrderScreen.routeName:
        setState(() {
          _selectedItem = OrderScreen();
        });
        break;
      case CategoriesScreen.routeName:
        setState(() {
          _selectedItem = CategoriesScreen();
        });
        break;
      case UploadBannerScreen.routeName:
        setState(() {
          _selectedItem = UploadBannerScreen();
        });
        break;
      case ProductScreen.routeName:
        setState(() {
          _selectedItem = ProductScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(33, 158, 188, 10),
        title: Text("Admin Panel"),
      ),
      sideBar: SideBar(
        items: [
          AdminMenuItem(
            title: 'DashBoard',
            icon: CupertinoIcons.macwindow,
            route: DashBoardScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Sellers',
            icon: CupertinoIcons.person_3_fill,
            route: SellerScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Withdrawal',
            icon: CupertinoIcons.money_dollar,
            route: WithdrawalScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Orders',
            icon: CupertinoIcons.cube_box_fill,
            route: OrderScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Categories',
            icon: Icons.category_rounded,
            route: CategoriesScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Upload Banner',
            icon: CupertinoIcons.uiwindow_split_2x1,
            route: UploadBannerScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Products',
            icon: CupertinoIcons.cart_fill,
            route: ProductScreen.routeName,
          ),
        ],
        selectedRoute: "",
        onSelected: (item) {
          screenSelector(item);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color.fromRGBO(2, 48, 71, 10),
          child: const Center(
            child: Text(
              'BlazeBazzar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color.fromRGBO(2, 48, 71, 10),
          child: const Center(
            child: Text(
              '❤️',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _selectedItem,
    );
  }
}
