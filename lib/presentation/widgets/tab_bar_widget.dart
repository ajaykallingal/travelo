import 'package:flutter/material.dart';
import 'package:travelo/constants/colors.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 2,
        margin:  EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTabItem("Round Trip", 0),
            _buildTabItem("One Way", 1),
            _buildTabItem("Multi-city", 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String label, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut, // Smooth transition
        padding: EdgeInsets.symmetric(
          vertical: isSelected ? 12 : 10,
          horizontal: isSelected ? 28 : 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.selectedTabColor : Colors.transparent,
          border: isSelected
              ? Border.all(color: AppColors.selectedTabColor, width: 1.5)
              : null, // Border only for selected tab
        ),
        child: Transform.scale(
          scale: isSelected ? 1.1 : 1.0, // Slight scaling for selected tab
          child: Text(
            label,
            style: TextStyle(
              fontSize: isSelected ? 16 : 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

