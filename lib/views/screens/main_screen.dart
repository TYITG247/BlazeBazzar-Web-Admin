import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Text("Admin Panel"),
      ),
      sideBar: SideBar(items: [
        AdminMenuItem(
            title: 'DashBoard', icon: CupertinoIcons.macwindow, route: '/'),
        AdminMenuItem(
            title: 'Sellers', icon: CupertinoIcons.person_3_fill, route: '/'),
        AdminMenuItem(
            title: 'Withdrawal', icon: CupertinoIcons.money_dollar, route: '/'),
        AdminMenuItem(
            title: 'Orders', icon: CupertinoIcons.cube_box_fill, route: '/'),
        AdminMenuItem(
            title: 'Categories', icon: Icons.category_rounded, route: '/'),
        AdminMenuItem(
            title: 'Upload Banner', icon: CupertinoIcons.uiwindow_split_2x1, route: '/'),
        AdminMenuItem(
            title: 'Products', icon: CupertinoIcons.cart_fill, route: '/'),
      ], selectedRoute: ""),
      body: Text("Dashboard"),
    );
  }
}
