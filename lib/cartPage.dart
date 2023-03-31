import 'package:flutter/material.dart';
import 'package:retailedshop/BottomNavBar.dart';
import 'package:retailedshop/CartAppBar.dart';
import 'package:retailedshop/CartItemSample.dart';
class CartPage extends StatefulWidget {




  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


  int Count = 1;
  int Price = 250;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(),
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                CartItemSamples(),
                Container(
                  //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
                  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF4C53A5),
                            borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.add,color: Colors.white,),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Add Coupon Code",style: TextStyle(color: Color(0xFF4C53A5),fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}
