import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    "assets/images/1.jpg",
                    width: 40,
                    height: 40
                ),
                Text(
                    "Google",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFF4C53A5),
                    ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
