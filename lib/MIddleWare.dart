import 'package:flutter/material.dart';
import 'package:retailedshop/Feature/Login%20Screen/Login_Screen.dart';
import 'package:retailedshop/HomeScreen.dart';
import 'package:retailedshop/auth.dart';

class MiddleWare extends StatefulWidget {
  const MiddleWare({Key? key}) : super(key: key);

  @override
  State<MiddleWare> createState() => _MiddleWareState();
}

class _MiddleWareState extends State<MiddleWare> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChange,
        builder:(context,snapshot){
          if(snapshot.hasData){
            return HomeScreen();
          }else{
            return LoginScreen();
          }
        }
    );
  }
}
