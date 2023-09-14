import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_for_new extends StatefulWidget {
  const Home_for_new({Key? key}) : super(key: key);

  @override
  State<Home_for_new> createState() => _Home_for_newState();
}

class _Home_for_newState extends State<Home_for_new> {
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
        
      ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(

                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Icon(Icons.location_on_sharp, color: Colors.white,),
                          ),
                          SizedBox(width: 10,),
                          Text("Location")
                        ],
                      ),
                      height: height*0.05,
                      width: width*0.35,
                      // color: Colors.grey,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Icon(Icons.search, color: Colors.white,),
                          ),
                          SizedBox(width: 10,),
                          Text("Search")
                        ],
                      ),
                      height: height*0.05,
                      width: width*0.35,
                      // color: Colors.grey,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    Icon(Icons.sort,color: Colors.white,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Image.asset(""),
                        height: height *0.12,
                        width: width*0.3,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ace Gym'),

                              ],
                            ),
                            Text('''Location : Near Sheela Bypass,
                  Rohtak''')


                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image.asset(""),
                        height: height *0.12,
                        width: width*0.3,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ace Gym'),

                              ],
                            ),
                            Text('''Location : Near Sheela Bypass,
                  Rohtak''')


                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image.asset(""),
                        height: height *0.12,
                        width: width*0.3,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ace Gym'),

                              ],
                            ),
                            Text('''Location : Near Sheela Bypass,
                  Rohtak''')


                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image.asset(""),
                        height: height *0.12,
                        width: width*0.3,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ace Gym'),

                              ],
                            ),
                            Text('''Location : Near Sheela Bypass,
                  Rohtak''')


                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image.asset(""),
                        height: height *0.12,
                        width: width*0.3,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ace Gym'),

                              ],
                            ),
                            Text('''Location : Near Sheela Bypass,
                  Rohtak''')


                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Image.asset(""),
                        height: height *0.12,
                        width: width*0.3,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ace Gym'),

                              ],
                            ),
                            Text('''Location : Near Sheela Bypass,
                  Rohtak''')


                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
