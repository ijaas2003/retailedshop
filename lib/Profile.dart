import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:retailedshop/auth.dart';
import 'package:retailedshop/Product.dart';
import 'package:retailedshop/State/UserProvider.dart';
import 'package:retailedshop/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();



  String username = "";
  String email = "";
  final User? user = Auth().currentUser;
  Widget _userUid() {
    return Text(user?.email ?? 'user email');
  }
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
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20)),
          Text(
            "Profile",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          SizedBox(height: 32,),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.photoURL!),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            //"Name : "+user.displayName!,
            "Name : ${user.displayName==null?username:user.displayName}",
            style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            //"email : "+user.email!,
            "Name : ${user.email==null?email:user.email}",
            style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16
            ),
          ),
        ],
      ),
    );
  }
}
