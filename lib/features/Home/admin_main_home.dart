
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/Dashboard/screens/employee_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unicons/unicons.dart';


class EmployeeMainScreen extends StatefulWidget {
  const EmployeeMainScreen({super.key});

  @override
  State<EmployeeMainScreen> createState() => _EmployeeMainScreenState();
}

class _EmployeeMainScreenState extends State<EmployeeMainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    CareProfessionalHome(),
    CareProfessionalHome(),
    CareProfessionalHome(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              const BoxShadow(
                color: Color(0xFFbebebe),
                offset: Offset(5, 5),
                blurRadius: 5,
              ),
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(3, 3),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buildBottomNavItem(0, Icons.dashboard, context),
              buildBottomNavItem(1, Icons.person, context),
              buildBottomNavItem(2, Icons.account_tree_sharp, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavItem(int index, IconData icon, BuildContext context) {
    return GestureDetector(
        onTap: () => _onItemTapped(index),
        child: _selectedIndex == index
            ? Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade100, width: 1)
          ),
          child: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(-3, -3),
                  ),
                  BoxShadow(
                    color: Colors.grey.shade50,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(3, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
                color: Pallete.originBlue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Colors.white,
                )
              ],
            ),
          ),
        )
            : Icon(
          icon,
          size: 25,
          color: Colors.grey.shade800,

        )
    );
  }
}
