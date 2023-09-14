
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sih_gym/screens/authentication/utils.dart';

import '../../widgets/buttons/button_1.dart';
import 'is_registered_page.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  @override
  void initState(){
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if(!isEmailVerified){
      sendVerificationEmail();

      timer =Timer.periodic(Duration(seconds: 3), (_)=>checkEmailVerified(),);
    }
  }
  @override

  void dispose(){
    timer?.cancel();

    super.dispose();
  }
  Future checkEmailVerified() async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }
  Future sendVerificationEmail() async{
    try{
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail=true);
    } catch (e){
      Utils.showSnackBar(e.toString());
    }
  }
  Widget build(BuildContext context) {

    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    if (isEmailVerified){
      return ConditionalWidgetPage();
    } else{
      return Scaffold(
        appBar: AppBar(
          title: Text("Verify Email"),

        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("A verification email has been sent to your email",style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center),
              SizedBox(height: 24,),
              SizedBox(
                width: width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        canResendEmail ? sendVerificationEmail():null ;
                      },
                      child: button_1(
                          btn_width: (width * .9),
                          btn_color: const Color(
                              0xFF0165FF),
                          btn_text: "Resend Email"
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                child: Text("Cancel", style: TextStyle(fontSize: 24),),
                onPressed: ()=> FirebaseAuth.instance.signOut()

                ,)
            ],
          ),
        ),
      );
    }



  }}
