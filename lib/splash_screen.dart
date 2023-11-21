import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multiroleapplication/home_screen.dart';
import 'package:multiroleapplication/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }
  void isLogin() async{
    SharedPreferences sp= await SharedPreferences.getInstance();
    bool islogin=sp.getBool('islogin')??false;
    if(islogin){
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      });

    }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      });

    }

  }
  Widget build(BuildContext context) {
    return Scaffold(
   body: Image(
     width: double.infinity,
     height: double.infinity,
     fit: BoxFit.fill,
     image: NetworkImage('https://images.pexels.com/photos/1366630/pexels-photo-1366630.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),),
    );
  }
}
