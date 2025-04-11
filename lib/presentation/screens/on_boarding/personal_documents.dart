import 'package:flutter/material.dart';
import '../../../widgets/custom_appbar.dart';

import 'adhar_card_details_screen.dart';
import 'adhar_card_verification_screen.dart';

class PersonalDocumentsScreen extends StatelessWidget {
  const PersonalDocumentsScreen({super.key});

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
              'Personal Documents',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Upload focused photos of below documents for faster verification',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            // Adhar Card - Navigates to PersonalScreen
            CustomDocumentWidget(
              text: 'Adhar Card',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdharCardDetailScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),

            // Pan 
            CustomDocumentWidget(
              text: 'Pan Card',
              onPressed: () {
            
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdharCardVerificationScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),

            // Driver’s License
            CustomDocumentWidget(
              text: 'Driver’s License',
              onPressed: () {
                // Add navigation or functionality for Driver’s License if needed
              },
            ),  
            // SizedBox(height: 40
            // ,),
            // Spacer(),
            //   CustomBottomButton(
            //     text: 'Submit ',
            //     onPressed: () {
            //       Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const OrdersScreen()),);
            //     },
            //   ),
          
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

// CustomDocumentWidget
class CustomDocumentWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // Optional callback function

  const CustomDocumentWidget({
    super.key,
    required this.text,
    this.onPressed, // Default value is null
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Trigger the callback when tapped
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black45),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Display the provided text
            Text(
              text,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),

            // Display the right arrow icon
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
