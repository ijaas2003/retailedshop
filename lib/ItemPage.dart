import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:retailedshop/ItemAppBar.dart';
import 'package:retailedshop/ItemBottomNavBar.dart';

class ItemPage extends StatelessWidget {
  List<Color> clr = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];
  final snap;
   ItemPage({Key? key,required this.snap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: ListView(
        children: [
          ItemAppBar(),
          Padding(padding: EdgeInsets.all(16),
             child: Image.network("${snap['product_img']}",height: 300,),
          ),
          Arc(
            height:30 ,
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(
                        top:48,
                        bottom: 20,
                    ),
                      child: Row(
                        children: [
                          Text("${snap['product_name']}",style: TextStyle(
                            fontSize: 23,
                            color: Color(0xFF4C53A5)
                          ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(
                          top: 12,bottom: 10
                      ),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         RatingBar.builder(initialRating: 4,
                            minRating: 1,
                           direction: Axis.horizontal,
                           itemCount: 5,
                           itemSize: 20,
                           itemPadding: EdgeInsets.symmetric(horizontal: 4),
                           itemBuilder: (context, _) => Icon(
                             Icons.favorite,
                             color: Color(0xFF4C53A5),
                           ),
                           onRatingUpdate: (index){},
                         ),
                        ],
                    ),),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "${snap['product_des']}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF4C53A5)
                      ),
                    ),),
                    Padding(padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Text("Color :",style: TextStyle(fontSize: 18,color: Color(0xFF4C53A5),fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),

                          Row(
                            children: [
                              for(int i = 0; i < 3;i++)
                              Container(
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                    color: clr[i],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 8
                                  )
                                ],
                              ),
                            )],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ItemBottomNavBar(snap: snap,),
    );
  }
}
