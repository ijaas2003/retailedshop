import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String email;
  final String uid;
  final String phonenumber;
  final String password;
  final String repassword;

  const User({
    required this.username,
    required this.email,
    required this.uid,
    required this.phonenumber,
    required this.password,
    required this.repassword,
});
  Map<String,dynamic> toJson() => {
    "username":username,
    "email":email,
    "password":password,
    "phonenumber":phonenumber,
    "password":password,
    "repassword":repassword,
    "uid":uid
  };
  static User fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;
    return User(
      username: snapshot['username'],
      email: snapshot['email'],
      phonenumber: snapshot['phonenumber'],
      password: snapshot['password'],
      repassword: snapshot['repassword'],
      uid: snapshot['uid']
    );
  }
}

