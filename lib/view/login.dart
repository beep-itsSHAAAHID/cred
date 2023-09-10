import 'package:cred/controllers/GoogleSignInProvider.dart';
import 'package:cred/view/users.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String _title = "Login";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> login(BuildContext context) async {
    try {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // Use Firebase Authentication to sign in with email and password
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
     Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (context) => const users()));

      print('Successfully logged in: ${userCredential.user?.email}');
    } catch (e) {
     print('Login Error: $e');
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 130,
              width: 430,
              decoration: const BoxDecoration(color: Color(0xff3e276b)),
              child:  Padding(
                  padding: EdgeInsets.only(left: 30, top: 30),
                  child: Text(
                    _title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              width: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.foliuminfotech.com/images/services/ionic-graphic-02.png'))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                constraints: const BoxConstraints(
                  maxWidth: 380,
                  maxHeight: 53,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                labelText: "Email",
                labelStyle: const TextStyle(color: Color(0xff000000)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffAD1982)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffAD1982)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                constraints: const BoxConstraints(
                  maxWidth: 380,
                  maxHeight: 53,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                labelText: "Password",
                labelStyle: const TextStyle(color: Color(0xff000000)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffAD1982)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffAD1982)),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            customButton(buttonText: _title,onTap: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => users()));
            }),
            customButton(buttonText: 'Sign Up',onTap: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => signup()));
            }),
            Padding(
              padding: const EdgeInsets.only(top: 38),
              child: InkWell(
                onTap: () {
                  final provider = Provider.of<GoogleSignInProvider>(
                      context, listen: false);
                  provider.googleLogin();
                },

                child: Container(
                  height: 70,
                  width: 330,
                  decoration: const BoxDecoration(
                    color: Colors.white60,
                    border: Border.fromBorderSide(BorderSide(color: Colors.black)),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center the icon and text horizontally
                      children: [
                        // Add your icon here
                        const Icon(
                          FontAwesomeIcons.google, // Replace with your desired icon
                          color: Colors.red,
                          size: 30,
                        ),
                        const SizedBox(width: 10), // Add some spacing between the icon and text
                        Text(
                          'Google Sign in',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )


          ],
        )),
      ),
    );
  }
  Padding customButton({required String buttonText, required Function() onTap,}) {
    return  Padding(
      padding: const EdgeInsets.only(top: 40),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 70,
          width: 330,
          decoration: const BoxDecoration(
              color: Color(0xff3e276b),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Center(
              child: Text(buttonText,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30))),
        ),
      ),
    );
  }
}
