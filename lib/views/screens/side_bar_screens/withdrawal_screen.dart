import 'package:flutter/material.dart';

class WithdrawalScreen extends StatelessWidget {
  static const String routeName = "\WithdrawalScreen";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Withdrawal',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
