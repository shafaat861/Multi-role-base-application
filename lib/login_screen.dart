import 'dart:html';

import 'package:flutter/material.dart';
import 'package:multiroleapplication/Student_screen.dart';
import 'package:multiroleapplication/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final ageController=TextEditingController();

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Sign Up'),
      backgroundColor: Colors.red,
      automaticallyImplyLeading: false,
      centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',

              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',

              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                hintText: 'age',

              ),
            ),
          ),
          const SizedBox(height: 80,),

          Padding(
            padding: const EdgeInsets.all(8.0),

            child: InkWell(
              onTap:() async{
                 SharedPreferences sp=await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());

                //user, admin, teacher
                 sp.setString('usertype', 'student');


                sp.setBool('islogin', true);
                
                Navigator.push(context, MaterialPageRoute(builder:(context)=> Student()));
              },
              child: Container(
                height: 50,
                color: Colors.blue,
                width: double.infinity,
                child: Center(
                  child: Text('Sign Up'),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }

  Future<void> asif() async{
    await Future.delayed(Duration(seconds: 10));
    print('delayed');

  }
}
