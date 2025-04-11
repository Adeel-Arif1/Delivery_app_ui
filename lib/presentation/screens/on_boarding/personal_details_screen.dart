import 'package:flutter/material.dart';

import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_button.dart';
import 'pending_documents_screen.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Personal Details',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter details below so we can serve you better',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              // Reusable Text Field Widgets
              const ReusableTextFieldWidget(
                label: 'Full Name',
                hintText: 'Enter your full name',
              ),
              const SizedBox(height: 16),
              const ReusableTextFieldWidget(
                label: 'Email Address',
                hintText: 'Enter your email address',
              ),
              const SizedBox(height: 16),
              const ReusableTextFieldWidget(
                label: 'Phone Number',
                hintText: 'Enter your phone number',
              ),
              const SizedBox(height: 16),
              const ReusableTextFieldWidget(
                label: 'Address',
                hintText: 'Enter your address',
              ),
              const SizedBox(height: 32),
              // Profile Picture Section
              const Text(
                'Your Profile Picture',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              const DottedContainerWidget(),
              const SizedBox(height: 16),
            Center(
              child: CustomBottomButton(
              text: 'Submit ',
              onPressed: () {//
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PendingDocumentsScreen()),);
              },
            ),
            ),],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class ReusableTextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;

  const ReusableTextFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black54),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black38),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black54),
            ),
          ),
        ),
        
      ],
    );
  }
}

class DottedContainerWidget extends StatelessWidget {
  const DottedContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, 
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45,
          style: BorderStyle.solid, 
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.person,
            size: 40,
            color: Colors.black54,
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              // Add logic for uploading photo
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.camera_alt, color: Colors.red),
                  SizedBox(width: 8),
                  Text(
                    'Upload Photo',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
