import 'package:cred/view/adduser.dart';
import 'package:flutter/material.dart';

class data1 extends StatefulWidget {
  final String name;
  final String phone;
  const data1({Key? key, required this.name, required this.phone}) : super(key: key);

  @override
  State<data1> createState() => _data1State();
}

class _data1State extends State<data1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
          Column(
            children: [
              InkWell(onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>adduser()));
              },
                child: Container(
                  height:220 ,
                  width: 420,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 330,bottom: 130),
                    child: const Icon(Icons.arrow_back,color: Colors.white,size: 50,),
                  ),
                  decoration:
                  BoxDecoration(
                    image: DecorationImage(image: NetworkImage('https://m.economictimes.com/thumb/height-450,width-600,imgsize-80160,msid-96629070/andrew-tate-gets-arrested-in-romania-know-who-is-he-and-what-happened.jpg'),fit: BoxFit.fill)
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                      Text(widget.name,style: TextStyle(fontSize: 23),)
                    ],
                    
                    
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Phone Number',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                      Text(widget.phone,style: TextStyle(fontSize: 23),)
                    ],

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('id',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                      Text('L001',style: TextStyle(fontSize: 23),)
                    ],
                  )

                ],
              )

              

              
              
              
            ],
          )

          
      ),

    );
  }
}
