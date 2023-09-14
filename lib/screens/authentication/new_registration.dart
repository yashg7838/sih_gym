import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phoneNumber = '';
  String _course='B.Tech' ;
  String _batch= '2019';
  String _UserType = 'student';
  String _MajorClub='ACM' ;
  String _clubPost = 'member';
  String _enrollment = '';
  String _regiNO = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(labelText: 'Name',
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
                      ),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: 'Phone Number',enabledBorder: OutlineInputBorder(
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
                      ),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _phoneNumber = value!;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField<String>(
                    value: _course,
                    decoration: InputDecoration(
                      labelText: 'Course',
                      border: OutlineInputBorder(),
                    ),
                    items: <String>['B.Tech', 'MBA','BBA','LLB']
                        .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _course = value!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField<String>(
                    value: _batch,
                    decoration: InputDecoration(
                      labelText: 'Batch',
                      border: OutlineInputBorder(),
                    ),
                    items: <String>['2018', '2019','2020','2021','2022','2023']
                        .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _batch = value!;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _MajorClub,
                    decoration: InputDecoration(
                      labelText: 'Major Club/ Sports',
                      border: OutlineInputBorder(),
                    ),
                    items: <String>['ACM', 'Environment Club','SciMat','Robotics Club']
                        .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _MajorClub = value!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Enrollment Number',enabledBorder: OutlineInputBorder(
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
                      ),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Enrollment Number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enrollment = value!;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Registration Number',enabledBorder: OutlineInputBorder(
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
                      ),),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Registration Number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _regiNO = value!;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _registerUser();
                      }
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _registerUser() async {


    try {

      CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('Users');


      DocumentReference<Map<String, dynamic>> newDocumentRef = collectionReference.doc(user.uid);


      await newDocumentRef.set({
        'Name': _name,
        'Phone_Number': _phoneNumber,
        'batch': _batch,
        'course': _course,
        'User Type': _UserType,
        'uid': user.uid,
        'Major Club': _MajorClub,
        'Club Post': _clubPost,
        'RegistrationNumber' : _regiNO,
        'EnrollmentNumber' : _enrollment,
        'SCEC' : "no"

      });

      // Document creation successful
      print('Document created with ID: ${newDocumentRef.id}');
    } catch (e) {
      // Handle errors
      print('Error creating document: $e');
    }
  }
}