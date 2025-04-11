// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../widgets/custom_appbar.dart';

class CnicCardDetailsScreen extends StatelessWidget {
  const CnicCardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cnic Card Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Upload focused picture of Cnic card for faster verification',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            AdharCardUploadWidget(
              text: 'Front side of your Cnic card with clear name and photo',
              buttonText: 'Upload Photo',
              onTap: () {
                // Add functionality here for uploading photo
                print('Upload Photo tapped');
              },
            ),
            const SizedBox(height: 20),
            AdharCardUploadWidget(
              text: 'Back side of your Cnic card for address verification',
              buttonText: 'Upload Back Side',
              onTap: () {
                // Add functionality here for uploading back side photo
                print('Upload Back Side tapped');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double borderRadius;

  DottedBorderPainter({
    required this.color,
    this.borderRadius = 10.0, 
  });

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 4;
    double dashSpace = 4;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(borderRadius),
      ));

    PathMetrics pathMetrics = path.computeMetrics();
    for (var metric in pathMetrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        final end = next < metric.length ? next : metric.length;
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance = end + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class AdharCardUploadWidget extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback? onTap;

  const AdharCardUploadWidget({
    super.key,
    required this.text,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CustomPaint(
        painter: DottedBorderPainter(
            color: Colors.grey.shade400, borderRadius: 12.0),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(12.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.red.shade300,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
