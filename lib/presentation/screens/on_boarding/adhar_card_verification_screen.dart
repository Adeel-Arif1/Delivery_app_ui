import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_button.dart';

class AdharCardVerificationScreen extends StatelessWidget {
  const AdharCardVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Adhar Card Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Upload focused picture of Adhar card for faster verification',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  AdharCardWidget(
                    mainText: 'Front side of your Adhar card with clear name and photo',
                    assetImagePath: 'lib/assets/card.png',
                    borderText: 'Uploaded',
                    onIconPressed: () {
                      // Add functionality for cross icon press
                    },
                  ),
                  const SizedBox(height: 20),
                  AdharCardWidget(
                    mainText: 'Back side of your Adhar card for address verification',
                    assetImagePath: 'lib/assets/card.png',
                    borderText: 'Uploaded',
                    onIconPressed: () {
                      // Add functionality for cross icon press
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: CustomBottomButton(
                text: 'Submit',
                onPressed: () {
                  // Handle OTP verification
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class AdharCardWidget extends StatelessWidget {
  final String mainText;
  final String assetImagePath;
  final String borderText;
  final VoidCallback onIconPressed;

  const AdharCardWidget({
    super.key,
    required this.mainText,
    required this.assetImagePath,
    required this.borderText,
    required this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(color: Colors.grey.shade400, borderRadius: 12.0),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Main Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                mainText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Image
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  assetImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Button Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        borderText,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: onIconPressed,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
