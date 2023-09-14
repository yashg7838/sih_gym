
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';


class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  DateTime _dob = DateTime.now();
  String _emergencyContact = '';
  String _phoneNumber = '';
  File? _profileImage;
  File? _govID;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Registration'),
        titleTextStyle: TextStyle(
          color: Colors.white
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
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
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: 'Emergency Phone Number',enabledBorder: OutlineInputBorder(
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
                        return 'Please enter emergency phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _emergencyContact = value!;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Date*',
                          border: OutlineInputBorder(),
                        ),
                        child: Text(
                          '${_dob.day}/${_dob.month}/${_dob.year}',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _selectProfileImage();
                    },

                    child: const Text('Select Profile Image*'),
                  ),
                  const SizedBox(height: 5.0),
                  if (_profileImage != null)
                    Image.file(
                      _profileImage!,
                      height: 200.0,
                      fit: BoxFit.cover,
                    )
                  else const Center(child: Text("Image Ratio: 2:3 (Height:Width)")),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _selectGovID();
                    },

                    child: const Text('Select Profile Image*'),
                  ),
                  const SizedBox(height: 5.0),
                  if (_govID != null)
                    Image.file(
                      _govID!,
                      height: 200.0,
                      fit: BoxFit.cover,
                    )
                  else const Center(child: Text("Image Ratio: 2:3 (Height:Width)")),
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

  Future<void> _selectProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if(await pickedFile.length()<4194304) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }
      else{
        showDialog(
            context: context,
            builder: (context){
              return Container(
                color: const Color.fromARGB(100, 22, 44, 33),
                child: AlertDialog(
                  title: const Text("Error"),
                  content: const Text("Image size exceeding 2mb."),
                  actions: [
                    TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text("Ok"))
                  ],
                ),
              );
            });
      }
    }
  }

  Future<void> _selectGovID() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if(await pickedFile.length()<4194304) {
        setState(() {
          _govID = File(pickedFile.path);
        });
      }
      else{
        showDialog(
            context: context,
            builder: (context){
              return Container(
                color: const Color.fromARGB(100, 22, 44, 33),
                child: AlertDialog(
                  title: const Text("Error"),
                  content: const Text("Image size exceeding 2mb."),
                  actions: [
                    TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text("Ok"))
                  ],
                ),
              );
            });
      }
    }
  }

  Future<String?> uploadProfileToFirebase(File imageFile, String fileName) async {
    try {
      Reference storageReference =
      FirebaseStorage.instance.ref().child("ProfileImage/$fileName");
      UploadTask uploadTask = storageReference.putFile(imageFile);

      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL of the uploaded image.
      String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (error) {
      print("Error uploading image: $error");
      return null;
    }
  }

  Future<String?> uploadIDToFirebase(File imageFile, String fileName) async {
    try {
      Reference storageReference =
      FirebaseStorage.instance.ref().child("GovID/$fileName");
      UploadTask uploadTask = storageReference.putFile(imageFile);

      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL of the uploaded image.
      String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (error) {
      print("Error uploading image: $error");
      return null;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dob,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dob = picked;
      });
    }
  }

  Future<void> _registerUser() async {
    try {
      CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('Users');
      DocumentReference<Map<String, dynamic>> newDocumentRef = collectionReference.doc(user.uid);
      String? _ProfileimageURL = await uploadProfileToFirebase(_profileImage!, user.uid);
      String? _GovIDURL = await uploadIDToFirebase(_govID!, user.uid);
      await newDocumentRef.set({
        'Name': _name,
        'Phone_Number': _phoneNumber,
        'Emergency_Number': _emergencyContact,
        'uid': user.uid,
        "profileImage": _ProfileimageURL,
        "govID": _GovIDURL,
      });

      // Document creation successful
    } catch (e) {
      print('Error creating document: $e');
    }
  }
}