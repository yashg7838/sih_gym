import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_gym/screens/client/scanner.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;
    return Scaffold(
      appBar: AppBar(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width*0.05,
              bottom: height*0.05,
              top: height*0.025),
              child: Text("Good Evening",
                style: TextStyle(fontSize: 40,
                  fontWeight: FontWeight.bold,),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: width * 0.25,
                  backgroundImage: NetworkImage("https://variety.com/wp-content/uploads/2021/04/Avatar.jpg"),
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: height*0.025,
                    top: height*0.025),
                child: Text("Talwalkers Gurgaon",
                  style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: width*0.25,
                height: height*0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                gradient: LinearGradient(
                  colors: [Colors.yellow, Color(0xffFFD700)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
                child: Center(
                  child: Text("GOLD",
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
          ],
        ),
      ),
    );
  }
}
