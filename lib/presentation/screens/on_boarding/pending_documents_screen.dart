import 'package:flutter/material.dart';

import '../../../widgets/custom_button.dart';
import 'personal_documents.dart';
import 'registration_complete_screen.dart';

class PendingDocumentsScreen extends StatelessWidget {
  const PendingDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Stack(
              children: [
                Container(
                  height: 200, //
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.orange],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(39),
                      bottomRight: Radius.circular(39),
                    ),
                  ),
                ),
                const Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to Delivery  App',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Just some steps away then you can earn with us',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Pending documents section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Pending Documents',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Reusable Row Container for Pending Documents
            RowContainerWidget(
              text: 'Personal documents ',
              icon: Icons.keyboard_arrow_right,
              onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PersonalDocumentsScreen()),);
                // Add functionality for row click
              },
            ),
            RowContainerWidget(
              text: 'Vehicle documents',
              icon: Icons.keyboard_arrow_right,
              onPressed: () {
                // Add functionality for row click
              },
            ),
            RowContainerWidget(
              text: 'Bank Account Details',
              icon: Icons.keyboard_arrow_right,
              onPressed: () {
                // Add functionality for row click
              },
            ),
            RowContainerWidget(
              text: 'Emergency Details',
              icon: Icons.keyboard_arrow_right,
              onPressed: () {
                // Add functionality for row click
              },
            ),

            const SizedBox(height: 16),

          
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Completed Documents',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 8),

      
            RowContainerWidget(
              text: 'Personal Information',
              icon: Icons.keyboard_arrow_right,
              showTick: true, 
              onPressed: () {
                // Add functionality for row click
              },
            ),

            const SizedBox(height: 32),

            // Custom Button
            Center(
              child: CustomBottomButton(
                text: 'Submit ',
                onPressed: () {
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegistrationCompleteScreen()),);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class RowContainerWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final bool showTick; // Optional parameter to show tick icon

  const RowContainerWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.showTick = false, // Defaults to false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Adjusted vertical padding
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12, 
                blurRadius: 6,
                offset: Offset(0, 3), 
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (showTick) 
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 20, 
                    ),
                  if (showTick) const SizedBox(width: 8), 
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              Icon(
                icon,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
