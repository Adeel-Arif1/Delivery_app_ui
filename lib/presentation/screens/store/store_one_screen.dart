import 'package:flutter/material.dart';
import '../../../widgets/togggle_bar.dart';
import '../../../widgets/custom_bottom_appbar.dart';
import '../../../widgets/custom_store_Appbar.dart';

class StoreOneScreen extends StatefulWidget {
  const StoreOneScreen({super.key});

  @override
  State<StoreOneScreen> createState() => _StoreOneScreenState();
}

class _StoreOneScreenState extends State<StoreOneScreen> {
  int _selectedIndex = 0;
  bool isMealSelected = true;
  bool isStoreSelected = false;
  String selectedDate = '24/08/2023';

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleMeal() {
    setState(() {
      isMealSelected = true;
      isStoreSelected = false;
    });
  }

  void _toggleStore() {
    setState(() {
      isMealSelected = false;
      isStoreSelected = true;
    });
  }

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomStoreAppBar(
        title: 'Orders',
        icon: Icons.lock_outline,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          ToggleRow(
            isMealSelected: isMealSelected,
            isStoreSelected: isStoreSelected,
            selectedDate: selectedDate,
            onMealToggle: _toggleMeal,
            onStoreToggle: _toggleStore,
            onDatePressed: _selectDate,
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/store.png',
                  height: 300,
                ),
                const SizedBox(height: 16),
                const Text(
                  'No New Orders',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
      ),
      backgroundColor: Colors.white,
    );
  }
}
