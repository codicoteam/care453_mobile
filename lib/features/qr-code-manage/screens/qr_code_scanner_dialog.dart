import 'dart:typed_data';

import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/core/utils/logs.dart';
import 'package:care453/models/visit_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScannerDialog extends StatefulWidget {
  final VisitModel visitModel;
  const QrCodeScannerDialog({super.key, required this.visitModel});

  @override
  State<QrCodeScannerDialog> createState() => _QrCodeScannerDialogState();
}

class _QrCodeScannerDialogState extends State<QrCodeScannerDialog> {
  List<String> uploadedImageUrl = [];

  final TextEditingController _descriptionontroller = TextEditingController();
  String barccodeValue = "";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.zero,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dialog Title
              Center(
                child: Text(
                  'Scan Qr Code',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Pallete.originBlue,
                      ),
                ).animate().fadeIn(duration: 400.ms),
              ),
              const SizedBox(height: 40),
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  child: MobileScanner(
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      final Uint8List? image = capture.image;
                      for (final barcode in barcodes) {
                        DevLogs.logWarning(
                            "Barcode found! ${barcode.rawValue}");
                        Get.dialog(Text("${barcode.rawValue}"));
                        setState(() {
                          barccodeValue = "${barcode.rawValue}";
                        });
                        if (widget.visitModel.id == "${barcode.rawValue}") {
                          DevLogs.logSuccess("Sucess is the best");
                        } else {
                          DevLogs.logSuccess("You learn from your mistakes");
                        }
                      }
                    },
                    controller: MobileScannerController(
                        detectionSpeed: DetectionSpeed.noDuplicates),
                  ),
                ),
              ),
              const SizedBox(height: 16),
                            const SizedBox(height: 16),


              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[500], // Replace with your color
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color:
                                    Colors.white, // Adjust text color if necessary
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
