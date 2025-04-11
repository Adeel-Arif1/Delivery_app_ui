import 'package:flutter/material.dart';
import '../../../widgets/togggle_bar.dart';
import '../../../widgets/custom_bottom_appbar.dart';
import '../../../widgets/custom_store_Appbar.dart';
import 'order_status_card.dart';

class StoreThreeScreen extends StatefulWidget {
  const StoreThreeScreen({super.key});

  @override
  State<StoreThreeScreen> createState() => _StoreOneScreenState();
}

class _StoreOneScreenState extends State<StoreThreeScreen> {
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
          const SizedBox(height: 20),

          // List of OrderStatusCard widgets
          Expanded(
            child: ListView(
              children: const [
                OrderStatusCard(
                  title: 'Order 1',
                  orderNumber: '12222',
                  status: 'Pickup Failed',
                  bottomIcon: Icons.keyboard_arrow_down,
                ),
                OrderStatusCard(
                  title: 'Order 2',
                  orderNumber: '12223',
                  status: 'Pickup Pending',
                  bottomIcon: Icons.keyboard_arrow_down,
                ),
                OrderStatusCard(
                  title: 'Order 3',
                  orderNumber: '12224',
                  status: 'Delivered',
                  bottomIcon: Icons.keyboard_arrow_down,
                ),
                OrderStatusCard(
                  title: 'Order 4',
                  orderNumber: '12225',
                  status: 'Pickup Rescheduled',
                  bottomIcon: Icons.keyboard_arrow_down,
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
