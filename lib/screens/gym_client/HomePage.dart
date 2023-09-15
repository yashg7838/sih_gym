import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_gym/screens/gym_client/QRCode.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;
    DateTime now = DateTime.now();
    String greeting = _getGreeting(now);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){

          },
          child: Icon(Icons.supervised_user_circle_rounded, color: Colors.white,),
        ),
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => QRCode(),));
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
                  backgroundImage: const NetworkImage("https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Z3ltfGVufDB8fDB8fHww&w=1000&q=80"),
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: height*0.025,
                    top: height*0.025),
                child: const Text("Talwalkers Gurgaon",
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                gradient: LinearGradient(
                  colors: [Colors.yellow, Color(0xffFFD700)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
                child: const Center(
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xffFFBEBA),
                      ),
                      child: const Center(
                        child: Text("Members",
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xffAAD3FF),
                      ),
                      child: const Center(
                        child: Text("Visitors",
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
                const Text("45",
                style: TextStyle(fontSize: 30),),
                SizedBox(
                  width: width*0.475,
                ),
                const Text("45",
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Color(0xffC3F2CB),
                ),
                child: const Center(
                  child: Text("Upgrade",
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
