import 'package:flutter/material.dart';

class SellerWidget extends StatelessWidget {
  const SellerWidget({super.key});

  Widget sellerData(int? flex, Widget widget) {
    return Expanded(
      flex: flex!,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: widget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          sellerData(
            2,
            Text("Demo Store"),
          ),
          sellerData(
            2,
            Text("City"),
          ),
          sellerData(
            2,
            Text("State"),
          ),
          sellerData(
            1,
            ElevatedButton(
              onPressed: () {},
              child: Center(
                child: Text("Reject"),
              ),
            ),
          ),
          sellerData(
            1,
            ElevatedButton(
              onPressed: () {},
              child: Center(
                child: Text("View More"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
