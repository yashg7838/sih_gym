import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class user_profile extends StatefulWidget {
  const user_profile({Key? key}) : super(key: key);

  @override
  State<user_profile> createState() => user_profileState();
}

class user_profileState extends State<user_profile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;
    return Scaffold(
      // backgroundColor: Colors.pink,
      appBar: AppBar(
        toolbarHeight: height*0.075,
        backgroundColor: Colors.black,
        title: const Text("Fitness",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bulbs.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: height*0.025,
                  ),
                  child: CircleAvatar(
                    radius: width * 0.25,
                    backgroundImage: NetworkImage("https://www.rd.com/wp-content/uploads/2020/01/GettyImages-1073667988-scaled.jpg?fit=700%2C467"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              Center(
                child: Padding(padding: EdgeInsets.only(
                  top: height*0.025,
                ),
                  child: const Text("Erlich Bachman",
                    style: TextStyle(fontSize: 40,
                    fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                  child: const Text("erlichbachman@piedpiper.com",
                    style: TextStyle(fontSize: 15),
                  ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*0.025,),
                child: SizedBox(
                  width: width*0.9,
                  child: Container(
                    width: width*0.9,
                    height: height*0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                    child: Center(child: Text("29128374650",
                      style: TextStyle(
                        fontSize: 17.5,
                      ),),),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*0.025,),
                child: SizedBox(
                  width: width*0.9,
                  child: Container(
                    width: width*0.9,
                    height: height*0.075,
                    child: Center(child: Text("29/10/2003",
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*0.025,),
                child: SizedBox(
                  width: width*0.9,
                  child: Container(
                    width: width*0.9,
                    height: height*0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                    child: Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: width*0.125),
                            child: Text("Invite people",
                              style: TextStyle(
                                fontSize: 17.5,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: width*0.2),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: const Color(0xffC3F2CB), textStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {},
                            child: const Text('Invite',),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: height*0.05,),
                child: SizedBox(
                  width: width*0.9,
                  height: height*0.07,
                  child:
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: const Color(0xffC3F2CB), textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                    child: const Text('Register Gym',),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: height*0.05,
                bottom: height*0.05),
                child: SizedBox(
                  width: width*0.9,
                  height: height*0.07,
                  child:
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: const Color(0xffC3F2CB), textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                    child: const Text('Log Out',),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
