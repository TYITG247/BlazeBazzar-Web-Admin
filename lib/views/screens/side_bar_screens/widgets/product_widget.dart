import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  final Stream<QuerySnapshot> _ordersStream =
      FirebaseFirestore.instance.collection('products').snapshots();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Widget orderData(int? flex, Widget widget) {
    return Expanded(
      flex: flex!,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: widget,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _ordersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final orderUserData = snapshot.data!.docs[index];
              return Container(
                child: Row(
                  children: [
                    orderData(
                      2,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(orderUserData['imageUrlList'][0]),
                      ),
                    ),
                    orderData(
                      2,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(orderUserData['productName']),
                      ),
                    ),
                    orderData(
                      2,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(orderUserData['productPrice'].toString()),
                      ),
                    ),
                    orderData(
                      2,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(orderUserData['quantity'].toString()),
                      ),
                    ),
                    orderData(
                      1,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: orderUserData['approved'] == false
                            ? ElevatedButton(
                                onPressed: () async {
                                  await _firestore
                                      .collection('orders')
                                      .doc(orderUserData['orderId'])
                                      .update({
                                    'approved': true,
                                  });
                                },
                                child: Center(
                                  child: Text("Accept"),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () async {
                                  await _firestore
                                      .collection('orders')
                                      .doc(orderUserData['orderId'])
                                      .update({
                                    'approved': false,
                                  });
                                },
                                child: Center(
                                  child: Text("Reject"),
                                ),
                              ),
                      ),
                    ),
                    orderData(
                      1,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Center(
                            child: Text("View More"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
