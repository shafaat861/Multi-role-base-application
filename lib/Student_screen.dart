import 'package:flutter/material.dart';
import 'package:multiroleapplication/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  String email='';
  String age='';
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData()async{
    SharedPreferences sp= await SharedPreferences.getInstance();
    email=sp.getString('email')??'';
    age=sp.getString('age')??'';

    setState(() {

    });
  }


  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('student view'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        automaticallyImplyLeading: false,),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Center(child: Text('Home Screen')),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Email'),
              Text(email.toString()),
              SizedBox(height: 20,),


            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('age'),
              Text(age.toString()),
              SizedBox(height: 20,),


            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),

            child: InkWell(
              onTap:() async{
                SharedPreferences sp=await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(context, MaterialPageRoute(builder:(context)=> LoginScreen()));
              },
              child: Container(
                height: 50,
                color: Colors.blue,
                width: double.infinity,
                child: Center(
                  child: Text('Logout'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
