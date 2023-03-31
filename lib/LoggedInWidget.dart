import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailedshop/Feature/Login%20Screen/Login_Screen.dart';
import 'package:retailedshop/GoogleSignInProvider.dart';
import 'package:retailedshop/Profile.dart';
import 'package:retailedshop/auth.dart';
import 'package:retailedshop/Product.dart';
import 'package:retailedshop/State/UserProvider.dart';
import 'package:retailedshop/auth.dart';
import 'package:retailedshop/Model/user.dart' as model;
class LoggedInWidget extends StatefulWidget {


  @override
  State<LoggedInWidget> createState() => _LoggedInWidgetState();

}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  final User? user = Auth().currentUser;


  Future<void> signOut() async{
    await Auth().signOut();
  }

  Widget _userUid() {
    return Text(user?.email ?? 'user email');
  }

  Widget _signOutButton() {
    return ElevatedButton(onPressed: signOut, child: const Text('sign out'));
  }
  String username = "";
  String email = "";
  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      username = (snap.data() as Map<String,dynamic>)!['username'];
      email = (snap.data() as Map<String,dynamic>)!['email'];
    });
  }


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4C53A5),
        elevation: 1.2,
        
        title: Text(
          "User Profile",
           style: TextStyle(
            fontWeight: FontWeight.bold,
             color: Colors.white,
             fontSize: 20
        ),
        ),
        actions: <Widget> [
          Padding(padding: EdgeInsets.all(20)),
          TextButton(onPressed: (){
            final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
            provider.Logout();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
              child:Text(
                "Logout",style: TextStyle(
                color: Colors.white,
                fontSize: 20,

              ),
              ),),
        ],
      ),
      body: Container(
        child: Column(
          children: [
              Profile(),
          ],
        ),
      ),
    );
  }
}
