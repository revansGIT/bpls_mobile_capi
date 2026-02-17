import 'package:get/get.dart';
import 'package:bpls_mobile/utils/constants.dart';
import 'package:flutter/material.dart';

void showTopSnackBar(String message) {
  final overlay = Overlay.of(Get.overlayContext!);
  final overlayEntry = OverlayEntry(
    builder:
        (context) => Positioned(
          top: 50, // Adjust the position from the top
          left: MediaQuery.of(context).size.width * 0.1,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
              child: Text(message, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
