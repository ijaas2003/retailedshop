import 'package:flutter/material.dart';
import 'package:retailedshop/ItemPage.dart';

class Items extends StatelessWidget {
  final snap;
  const Items({Key? key, this.snap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xFF4C53A5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "-50%",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(Icons.favorite_border, color: Colors.red,),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) =>
                              ItemPage(snap: snap,)));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          snap['product_img']),
                          height: 200,
                          width: 200,
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      snap['product_name'],
                      style: TextStyle(fontSize: 18,
                          color: Color(0xFF4C53A5),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(snap['product_des'], style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF4C53A5),
                    ),),),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$ ${snap['product_price']}",
                          style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5)),

                        ),
                        Icon(
                            Icons.shopping_cart_checkout,
                            color: Color(0xFF4C53A5)
                        ),
                      ],
                    ),)
                ],
              ),
    );

  }
}
