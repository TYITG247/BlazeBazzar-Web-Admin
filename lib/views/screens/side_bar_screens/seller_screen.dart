import 'package:blazebazzar_web_admin/views/screens/side_bar_screens/widgets/seller_widget.dart';
import 'package:flutter/material.dart';

class SellerScreen extends StatelessWidget {
  static const String routeName = "\SellerScreen";

  Widget _rowHeader(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black45,
          ),
          color: Color.fromRGBO(144, 224, 239, 100),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Manage Seller',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              _rowHeader("Business Name", 2),
              _rowHeader("City", 2),
              _rowHeader("State", 2),
              _rowHeader("Action", 1),
              _rowHeader("View more", 1),
            ],
          ),
          SellerWidget(),
        ],
      ),
    );
  }
}
