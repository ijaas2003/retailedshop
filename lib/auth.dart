import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:retailedshop/Model/user.dart' as model;


class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<model.User> getUserDetails() async {
    User currentUser = _firebaseAuth.currentUser!;

    DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }



  Future<String> createUserWithEmailAndPasswords({
    required String name,
    required String phonenumber,
    required String email,
    required String password,
    required String repassword,
  }) async{
    String res = "Some error";
    String passerr = 'please check password is equal';
    try{
      if(email.isNotEmpty || phonenumber.isNotEmpty || name.isNotEmpty || repassword.isNotEmpty || password.isNotEmpty){
        if(password==repassword){
          UserCredential cred =  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
          print(cred.user!.uid);

         model.User user = model.User(
           username:name,
           phonenumber:phonenumber,
           email:email,
           password:password,
           repassword:repassword,
           uid:cred.user!.uid,
         );
         await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
         res = 'success';
        }
        else{
          return passerr;
        }
      }
    }
    catch(err){
      return err.toString();
    }
  return res;
  }


  Future<String> loginUser({
  required String email,
    required String password,
}) async {
    String res = "Some error";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
        await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
      }
      else{
        res = "User need to fill the form  first";
      }
    }
    catch(err){
        return err.toString();
    }
    return res;
  }




  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
