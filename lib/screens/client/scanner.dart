import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:vibration/vibration.dart';
class QRCodeScannerScreen extends StatefulWidget {
  @override
  _QRCodeScannerScreenState createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  String qrCodeResult = "Scan a QR code"; // Initialize with a default message

  // Function to start the QR code scanner
  Future<void> startQRScan() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Color of the scanning screen
        'Cancel', // Cancel button text
        true, // Enable flash
        ScanMode.QR, // Scan mode (QR code in this case)
      );

      if (!mounted) return; // Avoid setting state if the widget is disposed
      if(qrCode.toString() == "-1"){
        setState(() {
          qrCodeResult = qrCode; // Update the QR code result in the state
        });
      }
      else{
        Vibration.vibrate();
      }

    } catch (e) {
      setState(() {
        qrCodeResult = 'Failed to get QR code: $e'; // Display an error message if scanning fails
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ticket Scanner"),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              qrCodeResult,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: startQRScan,
              child: const Text('Open Ticket Scanner'),
            ),
          ],
        ),
      ),
    );
  }
}
