// // ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

// import 'package:app1/Resources/App%20Colors/appcolors.dart';
// import 'package:flutter/material.dart';

// class CustomBottomNavBar extends StatefulWidget {
//   @override
//   _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
// }

// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//   return Align(
//     alignment: Alignment.bottomCenter,
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: Colors.black.withOpacity(0.5),
//       ),
//       margin: EdgeInsets.only(bottom: 10, left: 25, right: 0),
//       padding: EdgeInsets.all(2),
//       height: 65,
      
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _buildNavItem("assets/home/home1.png", "Home", 0),
//             _buildNavItem("assets/home/leave1.png", "", 1),
//             _buildNavItem("assets/home/expense1.png", "", 2),
//             _buildNavItem("assets/home/payslip1.png", "", 3),
//             _buildNavItem("assets/home/clock1.png", "", 4),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

//  Widget _buildNavItem(String assetPath, String label, int index) {
//   bool isSelected = _selectedIndex == index;
//   return GestureDetector(
//     onTap: () => _onItemTapped(index),
//     child: Container(
//       margin: EdgeInsets.only(right: 5, left: 5, top: 10, bottom: 10),
//       decoration: BoxDecoration(
//               color: isSelected ? MyColors.Peach.withOpacity(0.3) : Colors.grey.shade800,
//               border: isSelected ? Border.all(color: MyColors.Peach, width: 1) : null,
//               borderRadius: BorderRadius.circular(20),
//             ),
//       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             child: Center(
//               child: Image.asset(
//                 assetPath,
//                 height: 18,
//                 width: 18,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(width: 2), 
//           Text(
//             label,
//             style: TextStyle(
//               color: isSelected ? MyColors.Peach : Colors.grey.shade500,
//               fontSize: 12,
//               fontWeight: isSelected ? FontWeight.normal : FontWeight.normal,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }
import 'package:app1/Resources/App%20Colors/appcolors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black.withOpacity(0.5),
        ),
        margin: EdgeInsets.only(bottom: 10, left: 25, right: 0),
        padding: EdgeInsets.all(2),
        width: 300,
        height: 65,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildToggleNavItem("assets/home/home1.png", "Home", 0),
              _buildToggleNavItem("assets/home/leave1.png", "Leave", 1),
              _buildToggleNavItem("assets/home/expense1.png", "Expense", 2),
              _buildToggleNavItem("assets/home/payslip1.png", "Payslip", 3),
              _buildToggleNavItem("assets/home/clock1.png", "Clock", 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleNavItem(String assetPath, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        margin: EdgeInsets.only(right: 5, left: 5, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: isSelected ? MyColors.Peach.withOpacity(0.3) : Colors.grey.shade800,
          border: isSelected ? Border.all(color: MyColors.Peach, width: 1) : null,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              assetPath,
              height: 18,
              width: 18,
              fit: BoxFit.cover,
            ),
            if (isSelected) ...[
              SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  color: MyColors.Peach,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
