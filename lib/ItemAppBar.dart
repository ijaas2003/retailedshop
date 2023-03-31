import 'package:flutter/material.dart';
import 'package:retailedshop/Feature/Sign%20Up%20Screen/SignUp_Screen.dart';
import 'package:retailedshop/HomeScreen.dart';

class ItemAppBar extends StatefulWidget {
  const ItemAppBar({Key? key}) : super(key: key);

  @override
  State<ItemAppBar> createState() => _ItemAppBarState();
}
bool Colorss = true;
class _ItemAppBarState extends State<ItemAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFF4C53A5),
              size: 30,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 20),
            child: Text("Product",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: Color(0xFF4C53A5)
            ),),),
          Spacer(),
          InkWell(
            onTap: (){
              setState(() {
                  Colorss = !Colorss;
              });
            },
            child: Icon(
              Icons.favorite,
              size: 30,
              color: Colorss? Colors.red : Colors.black,
            ),
          )

        ],
      ),
    );
  }
}
