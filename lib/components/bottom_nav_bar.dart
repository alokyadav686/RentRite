import 'package:flutter/material.dart';
import 'package:rentrite/contants/colors.dart';
import 'package:rentrite/screens/agreement/agreement.dart';
import 'package:rentrite/screens/home/homescreen.dart';
import 'package:rentrite/screens/lawyers/lawyers.dart';
import 'package:rentrite/screens/profile/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  
  final List<Widget> _screens = [
    HomeScreen(),
    Lawyers(),
    Agreement(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor, 
        borderRadius: BorderRadius.circular(50), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, "Home", 0),
          _buildNavItem(Icons.pie_chart, "Lawyer", 1),
          _buildNavItem(Icons.article, "Agreements", 2),
          _buildNavItem(Icons.person, "Profile", 3),
        ],
      ),
    );
  }


  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.transparent, 
              shape: BoxShape.circle, 
            ),
            child: Icon(icon, color: isSelected? AppColors.White : const Color.fromARGB(219, 255, 255, 255), size: 26),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
