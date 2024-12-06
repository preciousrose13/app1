// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_unnecessary_containers, unused_field, unused_element

import 'dart:ui';
import 'package:app1/Resources/BottomNavbar/bottomnavbar.dart';
import 'package:app1/Resources/Button/button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Resources/App Colors/appcolors.dart';

class HomePage extends StatefulWidget {
  final String name;
  HomePage({super.key, required this.name});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
    String? _clockInTimestamp;

  double _sliderPosition = 0.0;
  bool _isComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/home/homebg.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 110,
                ),
                Text(
                  "Hi, ${widget.name}",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: MyColors.Purple,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.notifications_outlined, color: MyColors.Purple, size: 18),
                      SizedBox(width: 5),
                      Text(
                        "3",
                        style: TextStyle(color: MyColors.Purple, fontSize: 16),
                      ),
                    ],
                  ),
                ),
      
                SizedBox(
                  height: 60,
                ),
      
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 20),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                if (!_isComplete) ...[
                                  TextSpan(
                                    text: "Scan QR Code to Clock-In",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.Peach,
                                    ),
                                  ),
                                ] else ...[
                                  TextSpan(
                                    text: "Clocked in at\n",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: MyColors.Peach,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ".\n",
                                    style: TextStyle(
                                      color: Colors.transparent,
                                      fontSize: 5
                                    )
                                  ),
                                  TextSpan(
                                    text: "${DateFormat.jm().format(DateTime.now())}\n",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ".\n",
                                    style: TextStyle(
                                      color: Colors.transparent,
                                      fontSize: 5
                                    )
                                  ),
                                  TextSpan(
                                    text: "${DateFormat('dd MMM yyyy').format(DateTime.now())}",
                                    style: TextStyle(
                                      fontSize: 14, 
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
      
      
                          SizedBox(height: 5),
                          Divider(
                            color:  _isComplete ? MyColors.Peach : Colors.white,
                            thickness: 2,
                          ),
                          SizedBox(height: 10),
                          Text(
                             _isComplete ? "Location Not Available" :"Please scan the QR code provided by your organization to clock-in to Max",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                        
                          Stack(
                            children: [
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: MyColors.Peach, width: 1),
                                  color: _isComplete ? MyColors.Peach : MyColors.Purple,
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: _isComplete ? MyColors.Peach : MyColors.Purple,
                                          shape: BoxShape.circle,
                                        ),
                                        child: 
                                        Icon(
                                          Icons.alarm,
                                          color: _isComplete ? MyColors.Peach : MyColors.Purple,
                                        ),
                               
                                      ),
                                    ),
                                    Text(
                                      _isComplete ? "Slide to Clock-Out" : "Slide to Clock-In",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: _isComplete ? MyColors.Purple : MyColors.Peach,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: _isComplete ? MyColors.Purple : MyColors.Peach,
                                            width: 2,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: _isComplete ? MyColors.Purple : MyColors.Peach,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: _sliderPosition,
                                child: GestureDetector(
                                  onHorizontalDragUpdate: (details) {
                                    setState(() {
                                      _sliderPosition += details.delta.dx;
                                      _sliderPosition = _sliderPosition.clamp(
                                        0.0,
                                        MediaQuery.of(context).size.width - 120,
                                      );
                                    });
                                  },
                                  onHorizontalDragEnd: (details) {
                                    setState(() {
                                      if (_sliderPosition >= MediaQuery.of(context).size.width - 150) {
                                        if (!_isComplete) {
                                          // Save the formatted clock-in timestamp
                                          final now = DateTime.now();
                                          _clockInTimestamp = "Clocked in at\n${DateFormat.jm().format(now)}\n${DateFormat('dd MMM yyyy').format(now)}";
                                        }
                                        _isComplete = !_isComplete;
                                        _sliderPosition = MediaQuery.of(context).size.width - 120;
                                        Future.delayed(Duration(milliseconds: 500), () {
                                          setState(() {
                                            _sliderPosition = 0.0;
                                          });
                                        });
                                      } else {
                                        _sliderPosition = 0.0;
                                      }
                                    });
                                  },
                                  child: AnimatedOpacity(
                                    opacity: _sliderPosition >= MediaQuery.of(context).size.width - 150 ? 0.0 : 1.0,
                                    duration: Duration(milliseconds: 300),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: _isComplete ?  Colors.grey.shade900 : MyColors.Peach,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.alarm, color: _isComplete ? MyColors.Peach : MyColors.Purple),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
      
                SizedBox(height: 20),
      
                Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/home/leave.png",
                            height: 30,
                          ),
                          
                          SizedBox(height: 5),
                          Text("LEAVE", style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/home/expense.png",
                            height: 30,
                          ),
                          SizedBox(height: 5),
                          Text("EXPENSE", style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/home/payslip.png",
                            height: 30,
                          ),
                          SizedBox(height: 5),
                          Text("PAYSLIP", style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/home/letters.png",
                            height: 30,
                          ),
                          SizedBox(height: 5),
                          Text("LETTERS", style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
      
          SizedBox(height: 20),
      
          ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 25, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Activity",
                            style: TextStyle(color: Colors.white, fontSize: 18)
                          ),
                          IconButton(
                            onPressed: (){}, 
                            icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.white,),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: CustomBottomNavBar(),
    );
  }
}