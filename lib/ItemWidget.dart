import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:retailedshop/ItemPage.dart';
import 'package:retailedshop/Items.dart';
import 'package:retailedshop/cartPage.dart';
import 'package:supercharged/supercharged.dart';

class ItemWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context,AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index) => Items(
                snap:snapshot.data!.docs[index].data(),
              )),
        );
      },
    );
  }
}
