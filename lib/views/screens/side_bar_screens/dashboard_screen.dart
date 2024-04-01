import 'package:blazebazzar_web_admin/views/screens/side_bar_screens/widgets/dashboard_widget.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  static const String routeName = "\DashBoardScreen";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Dashboard',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          DashboardWidget(),
        ],
      ),
    );
  }
}
