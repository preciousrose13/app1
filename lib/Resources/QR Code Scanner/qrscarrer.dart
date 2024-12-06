import 'package:app1/Resources/App%20Colors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void onQRViewCreated(QRViewController qrController) {
    this.controller = qrController;
    controller?.scannedDataStream.listen((scanData) {
      controller?.pauseCamera();
      Navigator.pop(context, scanData.code); // Return scanned QR code
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code',
          style: TextStyle(
            color: Colors.white
          ),
          ),
        backgroundColor: MyColors.Purple,
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
      ),
    );
  }
}
