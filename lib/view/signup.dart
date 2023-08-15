import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cred/view/login.dart';
import 'package:cred/model/user_model.dart';
import 'package:cred/view/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class signup extends StatefulWidget {
   signup({Key? key}) : super(key: key);


  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {


  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController=TextEditingController();
    final TextEditingController phoneController=TextEditingController();

    Future<void> signup(BuildContext context) async {
      try {
        String email = emailController.text.trim();
        String password = passwordController.text.trim();

        //  Firebase Authentication
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        print('Successfully signed up: ${userCredential.user?.email}');
      } catch (e) {

        print('Signup Error: $e');
      }
    }

    return Scaffold(
      body: SafeArea(child:
      ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(

                    height: 130,
                    width: 430,
                    decoration: BoxDecoration(
                        color: Color(0xff3e276b)
                    ),
                    child:
                    Padding(
                        padding: const EdgeInsets.only(left: 80,top: 30),
                        child: Text('Signup',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w500,),
                        )

                    ),


                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13,top: 28),
                child: InkWell(onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));
                },
                  child: Container(
                    height: 60,
                    width: 60,
                    child:
                    Icon(Icons.arrow_back,color: Colors.black,size: 50,weight: 100,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Colors.purple,

                    ),
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 160,left: 110),
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('https://thumbs.dreamstime.com/b/male-avatar-icon-beard-his-mouth-gray-background-male-avatar-icon-beard-his-mouth-123115272.jpg')),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(80))
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(left: 220,top: 265),
                child: Container(
                  height: 50,
                  width: 50,
                  child: Icon(CupertinoIcons.pencil,size: 40,weight: 30,color: Colors.white,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),color: Colors.purple.shade800

                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 350),
                child: TextFormField(
                  controller: nameController,

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
                padding: const EdgeInsets.only(left: 15,top: 430),
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
                padding: const EdgeInsets.only(left: 15,top: 509),
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
                padding: const EdgeInsets.only(left: 15,top: 590),
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
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 660),
                child: InkWell(onTap: (){
                   signup(context);

                  // final user = UserModel(
                  //     name: nameController.text,
                  //     email: emailController.text,
                  //     phone: phoneController.text,
                  //     password: passwordController.text);
                  //
                  // print("Name : "+user.name);
                  // print(user.toJson());
                  // FirebaseFirestore.instance
                  // .collection("testUser")
                  // .add(user.toJson()).then((value){
                  //   print("succesfully added");
                  //   Navigator.of(context).pop();
                  // }).catchError((err){
                  //   print(err.toString());
                  // });

                },
                  child: Container(
                    height: 70,
                    width: 350,
                    child: Center(child: const Text('Register',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold))),
                    decoration:
                    BoxDecoration(
                      color: Color(0xff3e276b),
                      borderRadius: BorderRadius.all(Radius.circular(80))
                    ),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 120,top: 740),
                child: const Text('Already have an account?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 175,top: 760),
                child: Text('Login',style: TextStyle(color: Colors.red.shade900,fontWeight: FontWeight.w800,),),
              )


            ]

          ),
        ],
      ),



      ),
    );
  }
}
