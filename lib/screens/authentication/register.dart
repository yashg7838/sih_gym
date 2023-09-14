import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_gym/screens/authentication/utils.dart';

import '../../widgets/buttons/button_1.dart';



class Register extends StatefulWidget {

  final VoidCallback showLoginPage;

  const Register({
    Key? key,
    required this.showLoginPage,
  }) : super(key:key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * .3,
                  child: Image.asset("assets/images/login_image.png"),
                ),
                Container(
                  width: width,
                  height: height * .6,
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
                                      padding: EdgeInsets.only(bottom: 20.0),
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700
                                        ),
                                      )
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: SizedBox(
                                      width: width*.9,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: (){

                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(width: 1,color: const Color(0xFF969696)),
                                                  borderRadius: BorderRadius.circular(15)
                                              ),
                                              width: width*.223,
                                              height: 45,
                                              child: Center(
                                                child: Image.asset(
                                                  "assets/icons/flat-color-icons_google.png",
                                                  height: 28,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){

                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(width: 1,color: const Color(0xFF969696)),
                                                  borderRadius: BorderRadius.circular(15)
                                              ),
                                              width: width*.223,
                                              height: 45,
                                              child: Center(
                                                child: Image.asset(
                                                  "assets/icons/ic_round-facebook.png",
                                                  height: 28,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){

                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(width: 1,color: const Color(0xFF969696)),
                                                  borderRadius: BorderRadius.circular(15)
                                              ),
                                              width: width*.223,
                                              height: 45,
                                              child: Center(
                                                child: Image.asset(
                                                  "assets/icons/ic_round-apple.png",
                                                  height: 28,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),


                                  SizedBox(
                                    width: width*.9,
                                    child: const Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Text(
                                          "Or, Sign Up with...",
                                          style: TextStyle(
                                              color: Color(0xFF7E7E7E),
                                              fontWeight: FontWeight.w300
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                  SizedBox(
                                    height: 40,
                                    width: width * .9,
                                    child: TextFormField(
                                      controller: _nameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      keyboardType:
                                      TextInputType.name,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.person_2_outlined,
                                          color: Color(0xFF7E7E7E),
                                          size: 20,
                                        ),
                                        hintText: "Name",
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
                                    padding: const EdgeInsets.only(top: 15),
                                    child: SizedBox(
                                      height: 40,
                                      width: width * .9,
                                      child: TextFormField(
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
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: SizedBox(
                                      height: 40,
                                      width: width * .9,
                                      child: TextFormField(
                                        controller: _passwordController,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value)=> value != null && value.length <6
                                            ?'Enter min. 6 characters'
                                            :null,
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


                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: SizedBox(
                                      width: width*.9,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              signup();
                                            },
                                            child: button_1(
                                                btn_width: (width*.9),
                                                btn_color: const Color(0xFF0165FF),
                                                btn_text: "Sign Up"
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),




                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: SizedBox(
                                      width: width*.9,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Already a member?",
                                          ),
                                          GestureDetector(
                                            onTap: widget.showLoginPage ,
                                            child: Text(
                                              " Login.",
                                              style: TextStyle(
                                                  color: Color(0xFF0165FF)
                                              ),
                                            ),
                                          )

                                        ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signup() async{
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(context: context,
        barrierDismissible: false,
        builder: (lol) => Center(child: CircularProgressIndicator())
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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

