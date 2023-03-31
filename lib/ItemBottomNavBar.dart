import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBottomNavBar extends StatelessWidget {
  final snap;
  const ItemBottomNavBar({Key? key,required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey..withOpacity(0.5),
               spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0,3),
            ),
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$ ${snap['product_price']}",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xFF4C53A5)),
            ),
            ElevatedButton.icon(
              onPressed: (){

              },
              icon: Icon(
                CupertinoIcons.cart_badge_plus,
              ),
              label: Text(
                "Add to Cart",
                style:
                TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
                ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF4C53A5)),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                   vertical: 13,
                   horizontal: 15
                  ),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ))
              ),
            )
          ],
        ),
      ),
    );
  }
}
