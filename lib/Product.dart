import 'package:flutter/material.dart';
import 'package:retailedshop/Feature/Login%20Screen/Login_Screen.dart';
import 'package:retailedshop/cartPage.dart';


class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Icon(
              Icons.sort,
              size: 30,
              color: Color(0xFF4C53A5),
            ),
          ),

          Padding(padding: EdgeInsets.only(
            left: 20,
          ),
            child:
            Text(
              "Retail Shop",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4c53A5)
              ),
            ),
          ),
          Spacer(),
          Badge(
            backgroundColor: Colors.red,
            padding:EdgeInsets.all(7),

            child:InkWell(
              onTap: (){
                //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const CartPage(product_title: product_title, product_cost: product_cost, product_des: product_des, product_img: product_img)));
              },
              child: Icon(
                Icons.shopping_bag_outlined,
                size:32,
                color: Color(0xFF4c53A5),
              ),
            )
          ),
        ],
      ),
    );
  }
}
