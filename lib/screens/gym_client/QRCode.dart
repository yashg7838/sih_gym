// ignore_for_file: depend_on_referenced_packages, must_be_immutable, no_logic_in_create_state, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QRCode extends StatefulWidget {

  @override
  State<QRCode> createState() => QRCodeState();
}

class QRCodeState extends State<QRCode> {
  late List<Map<String, dynamic>> ticket_event;
  late List<Map<String, dynamic>> ticket;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Fitness",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: width*.05, right: width*.05),
          child: SizedBox(
            height: height*.8,
            width: width*.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Gymnasium",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                QrImageView(
                  data: "Gymnasium",
                  version: QrVersions.auto,
                  size: 200.0,
                  backgroundColor: Colors.white,
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
