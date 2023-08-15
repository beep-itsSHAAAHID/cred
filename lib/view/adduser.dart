import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cred/view/users.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class adduser extends StatefulWidget {
  const adduser({Key? key}) : super(key: key);

  @override
  State<adduser> createState() => _adduserState();
}

class _adduserState extends State<adduser> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameControler=TextEditingController();
    TextEditingController phoneController=TextEditingController();
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    return Scaffold(
      appBar: AppBar(

        title:  Text('Add Users',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w500,),
        ),
        backgroundColor: Color(0xff3e276b),
        toolbarHeight: 120,
        leading: InkWell(onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>users()));
        },
          child: Container(
            height: 60,
            width: 60,
            child: Icon(Icons.arrow_back,color: Colors.white,size: 50,),
            decoration:
            BoxDecoration(
              color: Colors.purple,

                shape: BoxShape.circle
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130,left: 10),
            child: TextFormField(
              controller: nameControler,
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxWidth: 380,
                  maxHeight: 53,
                ),
                contentPadding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: "Name",
                labelStyle: TextStyle(color: Color(0xff000000)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color(0xffAD1982)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color(0xffAD1982)),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10,top: 20),
            child: TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxWidth: 380,
                  maxHeight: 53,
                ),
                contentPadding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: "Phone Number",
                labelStyle: TextStyle(color: Color(0xff000000)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color(0xffAD1982)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color(0xffAD1982)),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10,top: 20),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxWidth: 380,
                  maxHeight: 53,
                ),
                contentPadding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: "Email",
                labelStyle: TextStyle(color: Color(0xff000000)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color(0xffAD1982)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color(0xffAD1982)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 20),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxWidth: 380,
                  maxHeight: 53,
                ),
                contentPadding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: "Password",
                labelStyle: TextStyle(color: Color(0xff000000)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color(0xffAD1982)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color(0xffAD1982)),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 80,
          ),

          InkWell(onTap: (){
            FirebaseFirestore.instance.collection("user").add({
              "name":nameControler.text,
              "phone":phoneController.text,
              "email":emailController.text,
              "password":passwordController.text
            });
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>users()));
          },
            child: Container(
              height: 70,
              width: 350,
              child: Center(child: const Text('Add',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold))),
              decoration:
              BoxDecoration(
                  color: Color(0xff3e276b),
                  borderRadius: BorderRadius.all(Radius.circular(80))
              ),

            ),
          ),




        ],
      ),


      ),
    );
  }
}
