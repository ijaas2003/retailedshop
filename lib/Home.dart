import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:retailedshop/Catagoies.dart';
import 'package:retailedshop/ItemWidget.dart';
import 'package:retailedshop/Product.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username = "";
  String email = "";

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      username = (snap.data() as Map<String,dynamic>)!['username'];
      email = (snap.data() as Map<String,dynamic>)!['email'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView(

      children:[
        Product(),
        Container(
          height: 600,
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )
          ),
          child: Column(
            children: <Widget> [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left:5),
                      height: 50,
                      width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here...",
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.camera_alt,
                      size: 27,
                      color: Color(0xFF4C53A5),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Text(
                  "Catagories",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight:FontWeight.bold,
                      color:Color(0xFF4C53A5)
                  ),
                ),
              ),
              CategoriesWidget(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10
                ),
                child: Text(
                  "Best Selling",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5)
                  ),
                ),
              ),
              ItemWidget(),
            ],
          ),
        ),
        ],
      );
  }
}
