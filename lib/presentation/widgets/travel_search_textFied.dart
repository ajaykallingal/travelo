import 'package:flutter/material.dart';


class TravelSearchTextFields extends StatelessWidget {


   const TravelSearchTextFields({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.flight_takeoff,
                    color: Color(0xFF2EA445),
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                   const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'From',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  // Swap Button
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2EA445).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.swap_vert,
                      color: Color(0xFF2EA445),
                      size: 20,
                    ),
                  ),
                ],
              ),
              // Green underline for From TextField
              Positioned(
                bottom: 0,
                left: 36, // Adjust based on icon width + spacing
                right: 48, // Adjust based on swap button width + spacing
                child: Container(
                  height: 2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF2EA445),
                        Color(0xFF2EA445),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // To TextField
          const Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Color(0xFF2EA445),
                size: 24,
              ),
              SizedBox(width: 12),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'To',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class TravelTextFieldsWithControllers extends StatefulWidget {
//
//   const TravelTextFieldsWithControllers({super.key});
//
//   @override
//   _TravelTextFieldsWithControllersState createState() =>
//       _TravelTextFieldsWithControllersState();
// }
//
// class _TravelTextFieldsWithControllersState
//     extends State<TravelTextFieldsWithControllers> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 4,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // From TextField
//           Stack(
//             children: [
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.flight_takeoff,
//                     color: Color(0xFF2EA445),
//                     size: 24,
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: TextField(
//                       controller: _fromController,
//                       readOnly: true,
//                       onTap: () async {
//                         final destination = await showDestinationSearch(context, bloc);
//                         if (destination != null) {
//                           _fromController.text = destination.city; // Use returned destination
//                         }
//                       },
//                       decoration: const InputDecoration(
//                         hintText: 'From',
//                         hintStyle: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                         ),
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.symmetric(vertical: 12),
//                       ),
//                     ),
//                   ),
//                   // Swap Button
//                   GestureDetector(
//                     onTap: _swapLocations,
//                     child: Container(
//                       width: 32,
//                       height: 32,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF2EA445).withOpacity(0.1),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.swap_vert,
//                         color: Color(0xFF2EA445),
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 10),
//
//           Container(
//             height: 2,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   AppColors.selectedTabColor,
//                  AppColors.appBarColor,
//                 ],
//               ),
//             ),
//           ),
//
//           // To TextField
//           Row(
//             children: [
//               const Icon(
//                 Icons.location_on_outlined,
//                 color: Color(0xFF2EA445),
//                 size: 24,
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: TextField(
//                   controller: _toController,
//                   onTap: () async {
//                     final destination = await showDestinationSearch(context, bloc);
//                     if (destination != null) {
//                       _toController.text = destination.city; // Use returned destination
//                     }
//                   },
//                   decoration: const InputDecoration(
//                     hintText: 'To',
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                     ),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(vertical: 12),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
