import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_gym/screens/client/scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_gym/screens/home/home_page.dart';


class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late List<Map<String, dynamic>> user_details;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;
    DateTime now = DateTime.now();
    String greeting = _getGreeting(now);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings),
        backgroundColor: Colors.black,
        title: const Text("Fitness",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        centerTitle: true,actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.qr_code_scanner_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => QRCodeScannerScreen(),));
          },
        )
      ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _fetchgetUserName(),
          builder:
              (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: Text("Please Wait"));
            }
            if(snapshot.hasData) {
              String userStatus = user_details[0]["user"];

              Color containerColor;
              String containerText;

              // Determine color and text based on userStatus
              if (userStatus == 'GOLD') {
                containerColor = Colors.yellow;
                containerText = 'GOLD';
              } else if (userStatus == 'SILVER') {
                containerColor = CupertinoColors.systemGrey5;
                containerText = 'SILVER';
              } else if (userStatus == 'PLATINUM') {
                containerColor = Colors.grey;
                containerText = 'PLATINUM';
              } else {
                // Default to Platinum
                containerColor = Colors.grey;
                containerText = 'PLATINUM';
              }


              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width*0.05,
                        bottom: height*0.05,
                        top: height*0.025),
                    child: Text(greeting,
                      style: TextStyle(fontSize: 40,
                        fontWeight: FontWeight.bold,),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: width * 0.25,
                        backgroundImage: NetworkImage(user_details[0]["profileImage"]),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: height*0.025,
                          top: height*0.025),
                      child: Text(user_details[0]["Name"],
                        style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: width*0.4,
                      height: height*0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: containerColor
                      ),
                      child: Center(
                        child: Text(containerText,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: height*0.015,
                          top: height*0.03,
                          left: width*0.025,
                          right: width*0.025),
                      child: Row(
                        children: [
                          Container(
                            width: width*0.4,
                            height: height*0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: Color(0xffFFBEBA),
                            ),
                            child: Center(
                              child: Text("Checked in:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                          ),
                          Container(
                            width: width*0.15,
                          ),
                          Container(
                            width: width*0.4,
                            height: height*0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: Color(0xffAAD3FF),
                            ),
                            child: Center(
                              child: Text("Days left:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width*0.175,
                      ),
                      Text("45",
                        style: TextStyle(fontSize: 30),),
                      SizedBox(
                        width: width*0.475,
                      ),
                      Text("45",
                        style: TextStyle(fontSize: 30),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height*0.05,
                      left: width*0.1,),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home_for_new(),));
                      },
                      child: Container(
                        width: width*0.8,
                        height: height*0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color(0xffC3F2CB),
                        ),
                        child: Center(
                          child: Text("Change Location",
                            style: TextStyle(fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  static Future<List<Map<String, dynamic>>> getUserName() async{
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    final List<Map<String, dynamic>> userDetails = [];
    final collectionRef = FirebaseFirestore.instance.collection('Users');
    final snapshot = await collectionRef.get();
    final documents = snapshot.docs;

    for (final doc in documents) {
      if(doc.data()["uid"].toString() == firebaseUser.uid) {
        userDetails.add(doc.data());
      }
    }
    return userDetails;
  }



  Future<List<Map<String, dynamic>>> _fetchgetUserName() async {
    user_details = await getUserName();
    return user_details;
  }

  String _getGreeting(DateTime now) {
    int hour = now.hour;
    if (hour >= 0 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }


}
