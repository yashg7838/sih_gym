import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_gym/screens/home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../main.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  late List<Map<String, dynamic>> user_details;
  late String userStatus = ''; // Add this variable

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.075,
        backgroundColor: Colors.black,
        title: const Text(
          "Fitness",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _fetchgetUserName(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: Text("Please Wait"));
          }
          if (snapshot.hasData) {
            // Set userStatus based on the value from the database
            if (user_details[0]["User"] != null) {
              userStatus = user_details[0]["User"];
            } else {
              // Handle the case when "User" is null or not available
              userStatus = 'PLATINUM'; // Default to Platinum or any other default value you prefer
            }

            return SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bulbs.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: height * 0.025,
                        ),
                        child: CircleAvatar(
                          radius: width * 0.25,
                          backgroundImage:
                          NetworkImage(user_details[0]["profileImage"]),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: height * 0.025,
                        ),
                        child: Text(
                          user_details[0]["Name"],
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Center(
                      child: const Text(
                        "yash.gupta.21cse@bmu.edu.in",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.025,
                      ),
                      child: SizedBox(
                        width: width * 0.9,
                        child: Container(
                          width: width * 0.9,
                          height: height * 0.075,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50)),
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                          child: Center(
                            child: Text(
                              user_details[0]["Phone_Number"],
                              style: TextStyle(
                                fontSize: 17.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.025,
                      ),
                      child: SizedBox(
                        width: width * 0.9,
                        child: Container(
                          width: width * 0.9,
                          height: height * 0.075,
                          child: Center(
                            child: Text(
                              userStatus,
                              style: TextStyle(
                                fontSize: 17.5,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50)),
                            color: getUserColor(userStatus),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.025,
                      ),
                      child: SizedBox(
                        width: width * 0.9,
                        child: Container(
                          width: width * 0.9,
                          height: height * 0.075,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50)),
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                          child: Row(
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(left: width * 0.125),
                                  child: Text(
                                    "Invite people",
                                    style: TextStyle(
                                      fontSize: 17.5,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.2),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: const Color(0xffC3F2CB),
                                    textStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {},
                                  child: const Text('Invite'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.05,
                      ),
                      child: SizedBox(
                        width: width * 0.9,
                        height: height * 0.07,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: const Color(0xffC3F2CB),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home_for_new(),
                              ),
                            );
                          },
                          child: const Text('Register Gym'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.05,
                        bottom: height * 0.05,
                      ),
                      child: SizedBox(
                        width: width * 0.9,
                        height: height * 0.07,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: const Color(0xffC3F2CB),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            signOut(context);
                          },
                          child: const Text('Log Out'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  // Helper function to get container color based on user status
  Color getUserColor(String status) {
    if (status == 'GOLD') {
      return Colors.yellow;
    } else if (status == 'SILVER') {
      return Colors.grey;
    } else if (status == 'PLATINUM') {
      return Colors.grey;
    } else {
      // Default to Platinum color
      return Colors.grey;
    }
  }

  Future<List<Map<String, dynamic>>> _fetchgetUserName() async {
    user_details = await getUserName();
    return user_details;
  }

  static Future<List<Map<String, dynamic>>> getUserName() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    final List<Map<String, dynamic>> userDetails = [];
    final collectionRef = FirebaseFirestore.instance.collection('Users');
    final snapshot = await collectionRef.get();
    final documents = snapshot.docs;

    for (final doc in documents) {
      if (doc.data()["uid"].toString() == firebaseUser.uid) {
        userDetails.add(doc.data());
      }
    }
    return userDetails;
  }
  void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }
}
