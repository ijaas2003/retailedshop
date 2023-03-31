import 'package:flutter/material.dart';
import 'package:retailedshop/HomeScreen.dart';
import 'package:retailedshop/Product.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(children: [
        InkWell(
          onTap: (){
            //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Product()));
          },
          child: Icon(Icons.arrow_back,
            size: 30,
            color: Color(0xFF4C53A5),
          ),
        ),

        Padding(padding: EdgeInsets.only(left: 20),
          child:
            Text("Cart",style:TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF4C53A5),fontSize: 23))

        ),
        Spacer(),
        Icon(Icons.more_vert ,size: 30,color: Color(0xFF4c53A5),)
        ],
      ),
    );
  }
}
