import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retailedshop/Feature/Login%20Screen/Login_Screen.dart';
import 'package:retailedshop/Feature/Sign%20Up%20Screen/SignUp_Screen.dart';
import 'package:retailedshop/GoogleSignInProvider.dart';
import 'package:retailedshop/HomeScreen.dart';
import 'package:retailedshop/ItemPage.dart';
import 'package:retailedshop/LoggedInWidget.dart';
import 'package:retailedshop/State/UserProvider.dart';


import 'package:retailedshop/cartPage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    super.initState();
    addDate();
  }
  addDate() async{
    UserProvider userProvider = Provider.of(context,listen: false);
    await userProvider.refreshUser();
  }


  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: ChangeNotifierProvider(
      create:(context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Retail shop app',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
          ),

          home: StreamBuilder(
            stream: FirebaseAuth.instance.idTokenChanges(),
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.active){
                if(snapshot.hasData){
                  return const HomeScreen();
                }
                else if(snapshot.hasError){
                  return Center(child: Text('${snapshot.error}'),);
                }
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              return SignupScreen();
            },
          ),

          ),
      ),
  );
}

