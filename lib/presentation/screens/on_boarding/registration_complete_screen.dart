import 'package:flutter/material.dart';

class RegistrationCompleteScreen extends StatelessWidget {
  const RegistrationCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Custom AppBar

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30), // Rounded corners for the bottom
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SafeArea(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Add back navigation logic
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_left, // Keyboard type icon
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Registration Complete',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Red Card Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.zero, // Straight corners
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your application is under Verification',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Account will get activated in 48 hours',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Image.asset(
                  'lib/assets/person.png', // Replace with the actual asset path
                  height: 60,
                  width: 60,
                ),
              ],
            ),
          ),

          // List Section
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ReusableRowContainer(
                  title: 'Personal Information',
                  status: 'Approved',
                  statusColor: Colors.green,
                ),
                SizedBox(height: 15),
                ReusableRowContainer(
                  title: 'Personal Documents',
                  status: 'Verification Pending',
                  statusColor: Colors.red,
                ),
                SizedBox(height: 15),
                ReusableRowContainer(
                  title: 'Vehicle Details',
                  status: 'Approved',
                  statusColor: Colors.green,
                ),
                SizedBox(height: 15),
                ReusableRowContainer(
                  title: 'Bank Account Details',
                  status: 'Approved',
                  statusColor: Colors.green,
                ),
                SizedBox(height: 15),
                ReusableRowContainer(
                  title: 'Emergency Details',
                  status: 'Approved',
                  statusColor: Colors.green,
                ),
              ],
            ),
          ),

          // Help Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Need Help?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    // Add navigation logic here
                  },
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Row Container
class ReusableRowContainer extends StatelessWidget {
  final String title;
  final String status;
  final Color statusColor;

  const ReusableRowContainer({
    super.key,
    required this.title,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
