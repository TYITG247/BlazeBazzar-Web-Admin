import 'package:blazebazzar_web_admin/views/screens/side_bar_screens/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = "\ProductScreen";

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
              'Product Screen',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              _rowHeader("Image", 1),
              _rowHeader("Name", 3),
              _rowHeader("Price", 2),
              _rowHeader("Quantity", 2),
              _rowHeader("Action", 1),
              _rowHeader("View more", 1),
            ],
          ),
          ProductWidget(),
        ],
      ),
    );
  }
}
