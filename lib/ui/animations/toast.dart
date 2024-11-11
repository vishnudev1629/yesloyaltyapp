import 'package:flutter/material.dart';

void showCustomToast(BuildContext context, String message,top) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top:top,
      
      
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.center,
        child: FractionalTranslation(
          translation: const Offset(0, -0.5),
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFD8D8D8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Hide the toast after a delay
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
