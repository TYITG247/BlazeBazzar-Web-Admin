import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SellerWidget extends StatefulWidget {
  const SellerWidget({super.key});

  @override
  State<SellerWidget> createState() => _SellerWidgetState();
}

class _SellerWidgetState extends State<SellerWidget> {
  final Stream<QuerySnapshot> _sellersStream =
      FirebaseFirestore.instance.collection('sellers').snapshots();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Widget sellerData(int? flex, Widget widget) {
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
      stream: _sellersStream,
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
              final sellerUserData = snapshot.data!.docs[index];
              return Container(
                child: Row(
                  children: [
                    sellerData(
                      2,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(sellerUserData['businessName']),
                      ),
                    ),
                    sellerData(
                      2,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(sellerUserData['cityValue']),
                      ),
                    ),
                    sellerData(
                      2,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(sellerUserData['stateValue']),
                      ),
                    ),
                    sellerData(
                      1,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: sellerUserData['approved'] == false
                            ? ElevatedButton(
                                onPressed: () async {
                                  await _firestore
                                      .collection('sellers')
                                      .doc(sellerUserData['sellerId'])
                                      .update({
                                    'approved': true,
                                  });
                                },
                                child: Center(
                                  child: Text("Approve"),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () async {
                                  await _firestore
                                      .collection('sellers')
                                      .doc(sellerUserData['sellerId'])
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
                    sellerData(
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
