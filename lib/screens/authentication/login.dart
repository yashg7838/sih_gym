import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sih_gym/main.dart';
import 'package:sih_gym/screens/authentication/utils.dart';
import 'package:sih_gym/screens/gym_client/HomePage.dart';

import '../../widgets/buttons/button_1.dart';
import 'forgetpasswordpage.dart';

class Login extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const Login({Key? key, required this.showRegisterPage}): super(key:key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bulbs.png"), fit: BoxFit.cover),
          ),
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: Container(
                    width: width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(bottom: 30.0),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w700
                                          ),
                                        )
                                    ),


                                    SizedBox(
                                      height: 40,
                                      width: width * .9,
                                      child: TextFormField(
                                        controller: _emailController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
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
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: SizedBox(
                                        height: 40,
                                        width: width * .9,
                                        child: TextFormField(
                                          controller: _passwordController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                          obscureText: true,
                                          obscuringCharacter: "*",
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.lock_outline_rounded,
                                              color: Color(0xFF7E7E7E),
                                              size: 20,
                                            ),
                                            hintText: "Password",
                                            hintStyle: const TextStyle(
                                              color: Color(0xFF7E7E7E),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 11,
                                            ),
                                            suffix: InkWell(
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen(),));
                                                },
                                                child: const Text("Forgot?")
                                            ),
                                            suffixStyle: const TextStyle(
                                                color: Color(0xFF0165FF),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF9B9B9B),
                                                  width: .5
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFFF1D1D),
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
                                      ),
                                    ),


                                    const SizedBox(
                                      height: 25,
                                    ),


                                    SizedBox(
                                      width: width * .9,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              signIN();
                                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                                            },
                                            child: button_1(
                                                btn_width: (width * .9),
                                                btn_color: const Color(
                                                    0xFF0165FF),
                                                btn_text: "Login"
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: SizedBox(
                                        width: width * .9,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 40),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: [
                                              const Text(
                                                "New to Fitness?",
                                              ),
                                              GestureDetector(
                                                  onTap:widget.showRegisterPage ,
                                                  child: const Text(
                                                    " Register.",
                                                    style: TextStyle(
                                                        color: Color(0xFF0165FF)
                                                    ),
                                                  ))

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIN() async {
    showDialog(context: context,
        barrierDismissible: false,
        builder: (lol) => const Center(child: CircularProgressIndicator())
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    Navigator.of(context).pop();
  }
}

