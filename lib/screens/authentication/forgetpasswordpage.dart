import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:sih_gym/screens/authentication/utils.dart';

import '../../widgets/buttons/button_1.dart';


class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Text(
                  "Enter your Email",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                )
            ),
            TextFormField(
              controller: _emailController,


              keyboardType:
              TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.alternate_email_rounded,
                  color: Color(0xFF7E7E7E),
                  size: 20,
                ),
                hintText: "Email Id",
                hintStyle: const TextStyle(
                  color: Color(0xFF7E7E7E),
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      color: Color(0xFF9B9B9B),
                      width: 0.5
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      color: Colors.red,
                      width: .5
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: .5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                resetPassword();
              },
              child: button_1(
                  btn_width: (width * .9),
                  btn_color: const Color(
                      0xFF0165FF),
                  btn_text: "Forget Password"
              ),
            ),
          ],
        ),
      ),
    );

  }
  Future resetPassword() async {
    showDialog(context: context,
        barrierDismissible:false,
        builder: (context)=> Center(child: CircularProgressIndicator()));
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      Utils.showSnackBar("Password Reset Email Sent");
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e){
      print(e);
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
    }
  }
