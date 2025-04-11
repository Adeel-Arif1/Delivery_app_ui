import 'package:flutter/material.dart';

import '../../../widgets/custom_pickup_card.dart';

class OrderStatusCard extends StatelessWidget {
  final String title;
  final String orderNumber;
  final String status;
  final IconData bottomIcon;

  const OrderStatusCard({
    Key? key,
    required this.title,
    required this.orderNumber,
    required this.status,
    required this.bottomIcon,
  }) : super(key: key);

  Color _getStatusColor() {
    switch (status) {
      case 'Pickup Failed':
      case 'Pickup Pending':
        return Colors.red.shade100;
      case 'Delivered':
        return Colors.green.shade100;
      case 'Pickup Rescheduled':
        return Colors.lightBlue.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  Color _getTextColor() {
    switch (status) {
      case 'Pickup Failed':
      case 'Pickup Pending':
        return Colors.red;
      case 'Delivered':
        return Colors.green;
      case 'Pickup Rescheduled':
        return Colors.lightBlue;
      default:
        return Colors.black87;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '#$orderNumber',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: _getTextColor(),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const PickupCard(
                        centerName: 'Pickup Center-1',
                        address: 'Nikhita Stores, 201/B, Nirant Apts, Andheri East 400069',
                        itemName: 'Besan Ladoo',
                        itemWeight: '500g',
                        quantity: 2,
                        imageUrl: 'https://www.pexels.com/photo/snowman-in-a-baku-cafe-with-festive-lights-29242553/', 
                      ),
                    );
                  },
                );
              },
              child: Icon(
                bottomIcon,
                color: Colors.red,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



//new card for test
// import 'package:flutter/material.dart';

// class OrderStatusCard extends StatelessWidget {
//   final String title;
//   final String orderNumber;
//   final String status;
//   final IconData bottomIcon;

//   const OrderStatusCard({
//     Key? key,
//     required this.title,
//     required this.orderNumber,
//     required this.status,
//     required this.bottomIcon,
//   }) : super(key: key);

//   Color _getStatusColor() {
//     switch (status) {
//       case 'Pickup Failed':
//       case 'Pickup Pending':
//         return Colors.red.shade100;
//       case 'Delivered':
//         return Colors.green.shade100;
//       case 'Pickup Rescheduled':
//         return Colors.lightBlue.shade100;
//       default:
//         return Colors.grey.shade100;
//     }
//   }

//   Color _getTextColor() {
//     switch (status) {
//       case 'Pickup Failed':
//       case 'Pickup Pending':
//         return Colors.red;
//       case 'Delivered':
//         return Colors.green;
//       case 'Pickup Rescheduled':
//         return Colors.lightBlue;
//       default:
//         return Colors.black87;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 6,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title and Order Number
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     '#$orderNumber',
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Colors.black54,
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: _getStatusColor(),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   status,
//                   style: TextStyle(
//                     color: _getTextColor(),
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),

//           // First Row: Person Icon, Text, and Phone Icon
//           Row(
//             children: [
//               const Icon(Icons.person, color: Colors.red, size: 20),
//               const SizedBox(width: 8),
//               const Expanded(
//                 child: Text(
//                   "John Doe",
//                   style: TextStyle(fontSize: 14, color: Colors.black87),
//                 ),
//               ),
//               const Icon(Icons.phone, color: Colors.red, size: 20),
//             ],
//           ),
//           const SizedBox(height: 12),

//           // Second Row: Hand Icon, Text, and Right-Aligned Icons
//           Row(
//             children: [
//               const Icon(Icons.handshake, color: Colors.grey, size: 20),
//               const SizedBox(width: 8),
//               const Expanded(
//                 child: Text(
//                   "Pickup Center 1",
//                   style: TextStyle(fontSize: 14, color: Colors.black87),
//                 ),
//               ),
//               const Icon(Icons.edit, color: Colors.grey, size: 20),
//               const SizedBox(width: 8),
//               const Icon(Icons.delete, color: Colors.grey, size: 20),
//             ],
//           ),
//           const SizedBox(height: 12),

//           // Address Text
//           const Text(
//             "123, Street Name, City, ZIP",
//             style: TextStyle(fontSize: 14, color: Colors.black54),
//           ),
//           const SizedBox(height: 12),

//           // Image, Item Name, and Quantity
//           Row(
//             children: [
//               Image.network(
//                 "https://via.placeholder.com/50",
//                 width: 50,
//                 height: 50,
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(width: 16),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     "Item Name",
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     "Quantity: 2",
//                     style: TextStyle(fontSize: 12, color: Colors.black54),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),

//           // Bottom Icon with Dialog
//           Align(
//             alignment: Alignment.centerRight,
//             child: GestureDetector(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return Dialog(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const Center(
//                         child: Text("Details Dialog"),
//                       ),
//                     );
//                   },
//                 );
//               },
//               child: Icon(
//                 bottomIcon,
//                 color: Colors.red,
//                 size: 24,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

