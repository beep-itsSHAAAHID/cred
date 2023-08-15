import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cred/view/adduser.dart';
import 'package:cred/view/data.dart';
import 'package:flutter/material.dart';


class users extends StatefulWidget {
  const users({Key? key}) : super(key: key);

  @override
  State<users> createState() => _usersState();
}

class _usersState extends State<users> {

  final List<String> users=['https://dailypost.ng/wp-content/uploads/2023/05/Messi.jpg',
    'https://e0.365dm.com/23/02/768x432/skysports-neymar-psg_6059202.jpg?20230216093830',
    'https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg',
    'https://www.planetsport.com/image-library/square/1200/k/kylian-mbappe-psg-france-3-april-2022.jpg',
  ];
  getUser()async{
    QuerySnapshot user = await FirebaseFirestore.instance.collection('user').get();

  }
  getUserListen()async{
    var user =  FirebaseFirestore.instance.collection('user').snapshots().listen((event) { });

  }

  List <String> names=[
    "Messi",
    "Ronaldo",
    "Neymar",
    "Mbappe"
  ];

  @override
  void initState() {
    getUser();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>adduser()));
        },
      backgroundColor: Colors.white70,
        elevation: 5,
        child: Icon(Icons.add_circle_outline_sharp,
        color: Color(0xff3e276b),size: 50,
        ),
      ),
      appBar: AppBar(
        title:  Text('Users',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w500,),
        ),
        backgroundColor: Color(0xff3e276b),
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        child: SafeArea(child:
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("user").snapshots(),
                builder: (context, snapshot) {
                  var data = snapshot.data?.docs;
                  print(data?.length);
                  return Container(

                  );
                  // return ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: data?.length ?? 1,
                  //   itemBuilder: (context, index){
                  //     // return ListTile(
                  //     //   title: Text(users[index]),
                  //     // );
                  //     return  Dismissible(
                  //       background: Row(
                  //         children: [
                  //           Container(
                  //             width: MediaQuery.of(context).size.width,
                  //             height: 200,
                  //             color: Colors.red,
                  //           )
                  //         ],
                  //       ),
                  //       onDismissed: (direction){
                  //         FirebaseFirestore.instance.collection("user").doc(data?[index].id).delete();
                  //       },
                  //       key: GlobalKey(),
                  //       child: InkWell(
                  //         onTap: (){
                  //         Navigator.push(context, MaterialPageRoute(builder: (context) => data1(name:data?[index]['name'],phone: data?[index]['phone'],)));
                  //       },
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           height: 89,
                  //           width: 390,
                  //           margin: EdgeInsets.only(bottom: 20),
                  //           child: Row(
                  //             children: [
                  //               SizedBox(
                  //                 width: 20,
                  //               ),
                  //               CircleAvatar(
                  //                 radius: 30,backgroundColor: Colors.black,
                  //                 backgroundImage: NetworkImage(users[index]),
                  //               ),
                  //               SizedBox(
                  //                 width: 20,
                  //               ),
                  //               Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                    Text(data?[index]['Name'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                  //                 ],
                  //               ),
                  //               SizedBox(
                  //                 width: 20,
                  //               ),
                  //               Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   Text(data?[index]['phone'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                  //                 ],
                  //               )
                  //             ],
                  //           ),
                  //           decoration: BoxDecoration(
                  //             color: Colors.white60,
                  //             boxShadow: [
                  //               BoxShadow(blurRadius:5,color: Colors.grey, blurStyle: BlurStyle.outer,)
                  //             ],
                  //           ),
                  //
                  //         ),
                  //       ),
                  //     );
                  //
                  //   }
                  // );
                }
              ),
              SizedBox(
                height: 20,
              ),






            ],
          ),
        ),
          
        ),
      ),
    );
  }
}
