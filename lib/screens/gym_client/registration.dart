import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);

  @override
  State<registration> createState() => registrationState();
}

class registrationState extends State<registration> {
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
          height: height*0.925,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bulbs.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Center(
                child: Padding(padding: EdgeInsets.only(
                    top: height*0.05,
                ),
                child: const Text("Registration Form",
                style: TextStyle(fontSize: 30),),),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*0.025,),
                child: SizedBox(
                  width: width*0.9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(0, 0, 0, 0.5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Gym Name',
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*0.025,),
                child: SizedBox(
                  width: width*0.9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(0, 0, 0, 0.5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Location',
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*0.025,
                left: width*0.05),
                child: Row(
                  children: [
                    SizedBox(
                      width: width*0.4,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: const Color.fromRGBO(0, 0, 0, 0.5),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: 'Area',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width*0.1,
                    ),
                    SizedBox(
                      width: width*0.4,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: const Color.fromRGBO(0, 0, 0, 0.5),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: 'Capacity',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*0.025,),
                child: SizedBox(
                  width: width*0.9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(0, 0, 0, 0.5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'No. of gym equipments',
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: height*0.025,),
                child: SizedBox(
                  width: width*0.9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(0, 0, 0, 0.5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'No of trainers ',
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: height*0.025,),
                child: SizedBox(
                  width: width*0.9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(0, 0, 0, 0.5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Timings',
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
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
                    style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: const Color(0xffE5E5E5), textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                    child: const Text('Submit',),
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
