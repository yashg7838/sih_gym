import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            // do something
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
              top: height*0.05),
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

          ],
        ),
      ),
    );
  }
}
