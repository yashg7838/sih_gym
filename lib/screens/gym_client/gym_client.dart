import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:easy_upi_payment/easy_upi_payment.dart';

class gym_client extends StatefulWidget {
  const gym_client({Key? key}) : super(key: key);

  @override
  State<gym_client> createState() => gym_clientState();
}

class gym_clientState extends State<gym_client> {
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
                    backgroundImage: NetworkImage("https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Z3ltfGVufDB8fDB8fHww&w=1000&q=80"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              Center(
                child: Padding(padding: EdgeInsets.only(
                  top: height*0.025,
                ),
                  child: const Text("Talwalkers gym",
                    style: TextStyle(fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: const Text("Gurgaon",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top:height*0.025),
                  child: const Text("6AM-11PM",
                    style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold),
                  ),
                ),
              ),



              Padding(
                padding: EdgeInsets.only(top: height*0.05,),
                child: Container(
                  width: width*0.4,
                  height: height*0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color(0xffad9c00),
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
              Padding(padding: EdgeInsets.only(top: height*0.05,
                  bottom: height*0.05,
                left: width*0.05,
                right:width*0.05,
              ),
              child: Row(
                children: [
                  Container(
                    width: width*0.25,
                    height: height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color.fromARGB(100, 255, 255, 255),
                    ),
                    child: Center(
                      child: Text("Equipments",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left:width*0.05),
                    child: Container(
                      width: width*0.25,
                      height: height*0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color.fromARGB(100, 255, 255, 255),
                      ),
                      child: Center(
                        child: Text("Capacity",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left:width*0.05),
                    child: Container(
                      width: width*0.25,
                      height: height*0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color.fromARGB(100, 255, 255, 255),
                      ),
                      child: Center(
                        child: Text("Trainers",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ),
                  ),
                ],
              ),
              ),


              Padding(padding: EdgeInsets.only(top: height*0.001,
                bottom: height*0.05,
                left: width*0.05,
                right:width*0.05,
              ),
                child: Row(
                  children: [
                    Container(
                      width: width*0.25,
                      height: height*0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color.fromRGBO(0, 0, 0, 0),
                      ),
                      child: Center(
                        child: Text("35",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(left:width*0.05),
                      child: Container(
                        width: width*0.25,
                        height: height*0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color.fromRGBO(0, 0, 0, 0),
                        ),
                        child: Center(
                          child: Text("300",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(left:width*0.05),
                      child: Container(
                        width: width*0.25,
                        height: height*0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color.fromRGBO(0, 0, 0, 0),
                        ),
                        child: Center(
                          child: Text("20",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: height*0.005,
                    bottom: height*0.05),
                child: SizedBox(
                  width: width*0.9,
                  height: height*0.07,
                  child:
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: const Color(0xffC3F2CB), textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      // _pay();
                    },
                    child: const Text('Purchase Subscription',),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // _pay() async {
  //   final res = await EasyUpiPaymentPlatform.instance.startPayment(
  //     EasyUpiPaymentModel(
  //       payeeVpa: '9368864036@okbizaxis',
  //       payeeName: 'Gharelu',
  //       amount: 10.0,
  //       description: 'Shuttle Ticket',
  //     ),
  //   );
  //   // TODO: add your success logic here
  //   print(res);
  // }
}
