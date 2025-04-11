// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../core/constants/colors.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_button.dart';

import 'personal_details_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading Text
            const Text(
              'Enter OTP to verify',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTextColor, 
              ),
            ),
            const SizedBox(height: 8),

            
            RichText(
              text: const TextSpan(
                text: 'A 6-digit OTP has been sent to your phone number ',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryTextColor, 
                ),
                children: [
                  TextSpan(
                    text: '+ 91 31111560369 ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Change',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            
            const Text(
              'Enter OTP Text',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // OTP Text Field
            OtpTextField(
              numberOfFields: 6,
              borderColor: AppColors.primaryColor,
              focusedBorderColor: AppColors.primaryColor,
              cursorColor: AppColors.primaryColor,
              textStyle: const TextStyle(color: AppColors.primaryTextColor),
              fieldWidth: 40,
              showFieldAsBox: true,
              onSubmit: (String otp) {
                // Handle OTP submission
                print("OTP Entered: $otp");
              },
            ),
            const SizedBox(height: 40),

            
            CustomBottomButton(
              text: 'Verify OTP',
              onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PersonalDetailsScreen()),);
              },
            ),
          ],
        ),
      ),backgroundColor: Colors.white,
    );
  }
}
