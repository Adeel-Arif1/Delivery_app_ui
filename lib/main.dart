// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'presentation/screens/application_submit_screen.dart';
import 'presentation/screens/ask_for_leave_screen.dart';
import 'presentation/screens/map/map_screen.dart';
import 'presentation/screens/on_boarding/onboarding_Screen.dart';
import 'presentation/screens/on_boarding/personal_documents.dart';
import 'presentation/screens/on_boarding/adhar_card_details_screen.dart';
import 'presentation/screens/on_boarding/adhar_card_verification_screen.dart';
import 'presentation/screens/on_boarding/otp_screen.dart';
import 'presentation/screens/on_boarding/pending_documents_screen.dart';
import 'presentation/screens/on_boarding/personal_details_screen.dart';
import 'presentation/screens/on_boarding/registration_complete_screen.dart';
import 'presentation/screens/store/order_status_card.dart';
import 'presentation/screens/store/store_one_screen.dart';
import 'presentation/screens/store/store_three_screen.dart';
import 'presentation/screens/store/store_two_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AskForLeaveScreen(),
    );
  }
}
