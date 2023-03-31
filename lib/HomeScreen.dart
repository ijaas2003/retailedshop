import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailedshop/Home.dart';
import 'package:retailedshop/ItemPage.dart';
import 'package:retailedshop/ItemWidget.dart';

import 'package:retailedshop/Catagoies.dart';

import 'package:draggable_fab/draggable_fab.dart';
import 'package:retailedshop/LoggedInWidget.dart';
import 'package:retailedshop/Product.dart';
import 'package:retailedshop/State/UserProvider.dart';
import 'package:retailedshop/auth.dart';
import 'package:retailedshop/Model/user.dart' as model;
import 'package:retailedshop/cartPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {



  String username = "";
  String password = "";

  @override

  void getUserName() async {
   DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
   setState(() {
     username = (snap.data() as Map<String,dynamic>)!['username'];
     password = (snap.data() as Map<String,dynamic>)!['password'];
   });
  }
  int _page = 0;
  late PageController pageController;
  @override


  void onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }
  void initState() {
    super.initState();
    pageController = PageController();
  }
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
void navigationTapped(int page){
  pageController.jumpToPage(page);
}



  @override
  Widget build(BuildContext context) {


      return Scaffold(

        body: PageView(
          children: [
            Home(),
            CartPage(),
            ItemPage(snap: null,),
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        floatingActionButton: DraggableFab(
          child: FloatingActionButton(
            backgroundColor: Color(0xFF4C53A5),
            onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  LoggedInWidget()));
            },
            child: Icon(
              Icons.people_alt,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          onTap: (_page) {
            navigationTapped(_page);
          },
          height: 70,
          color: Color(0xFF4C53A5),

          items: [

            Icon(Icons.home
            ,size: 30,
              color: Colors.white,

            ),
            Icon(CupertinoIcons.cart_fill,
              size: 30,
              color: Colors.white,
            ),
            Icon(Icons.list,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      );
  }
}
