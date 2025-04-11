import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';

class AskForLeaveScreen extends StatelessWidget {
  const AskForLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double fieldHeight = 60; // Set consistent height for all fields

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Ask for Leave',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF5F5F5), // Light grey background color
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tabs for "New Application" and "My Application"
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Handle "New Application" tap
                        },
                        child: const Column(
                          children: [
                            Text(
                              "New Application",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Divider(color: Colors.red, thickness: 2),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Handle "My Application" tap
                        },
                        child: const Column(
                          children: [
                            Text(
                              "My Application",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Divider(color: Colors.transparent, thickness: 2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Request your leave details below",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // Fields with consistent height and borders
                FieldRow(
                  label: "How many days?",
                  height: fieldHeight,
                  child: DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(value: "1", child: Text("1 Day")),
                      DropdownMenuItem(value: "2", child: Text("2 Days")),
                    ],
                    onChanged: (value) {},
                    decoration: _fieldDecoration(hintText: "Select"),
                  ),
                ),
                const SizedBox(height: 16),

                FieldRow(
                  label: "From",
                  height: fieldHeight,
                  child: TextFormField(
                    readOnly: true,
                    decoration: _fieldDecoration(hintText: "Select start date"),
                    onTap: () {
                      // Show date picker
                    },
                  ),
                ),
                const SizedBox(height: 16),

                FieldRow(
                  label: "To",
                  height: fieldHeight,
                  child: TextFormField(
                    readOnly: true,
                    decoration: _fieldDecoration(hintText: "Select end date"),
                    onTap: () {
                      // Show date picker
                    },
                  ),
                ),
                const SizedBox(height: 16),

                FieldRow(
                  label: "Reason",
                  height: fieldHeight,
                  child: DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(value: "Sick", child: Text("Sick")),
                      DropdownMenuItem(value: "Vacation", child: Text("Vacation")),
                      DropdownMenuItem(value: "Other", child: Text("Other")),
                    ],
                    onChanged: (value) {},
                    decoration: _fieldDecoration(hintText: "Select"),
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  "Comments",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  maxLines: 5,
                  maxLength: 200,
                  decoration: InputDecoration(
                    hintText: "Explain the reason for your leave in detail...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                const SizedBox(height: 4),

                // Submit button
                SizedBox(
                  width: double.infinity,
                  child: CustomBottomButton(
              text: 'Submit ',
              onPressed: () {
                // Handle OTP verification
              },
            ),
                ),
              ],
            ),
          ),
        ),
      ), backgroundColor: Colors.white,
    );
  }

  InputDecoration _fieldDecoration({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      suffixIcon: hintText == "Select"
          ? const Icon(Icons.arrow_drop_down, color: Colors.red)
          : const Icon(Icons.calendar_today, color: Colors.red),
    );
  }
}

class FieldRow extends StatelessWidget {
  final String label;
  final Widget child;
  final double height;

  const FieldRow({
    super.key,
    required this.label,
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        const Spacer(),
        SizedBox(
          width: 200,
          height: height,
          child: child,
        ),
      ],
    );
  }
}
