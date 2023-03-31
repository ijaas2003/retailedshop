import 'package:flutter/material.dart';
class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total :",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5)
                ),),
                Text("\$250",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xFF4C53A5)
                ),)
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF4C53A5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Check out", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

    