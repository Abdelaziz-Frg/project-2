import 'package:flutter/material.dart';
import 'package:personnel_managment/compenent/color.dart';
import 'package:personnel_managment/screen/Home%20page/home.dart';
import 'package:personnel_managment/screen/addpage/Addpreson.dart';
import 'package:personnel_managment/screen/modeferpage/modifierpage.dart';

class selctedpage extends StatefulWidget {
  int selectedIndex;
  selctedpage({super.key, required this.selectedIndex});

  @override
  State<selctedpage> createState() => _selctedpageState();
}

class _selctedpageState extends State<selctedpage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        NavigationRail(
          extended: false,
          backgroundColor: mainGreen,
          selectedIndex: widget.selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              widget.selectedIndex = index;
              if (index == 0) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              }
              if (index == 1) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Addpreson()),
                );
              }
              if (index == 2) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Modifierpage()),
                );
              }
            });
          },
          labelType: NavigationRailLabelType.all,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined, color: darkGreen),
              selectedIcon: Icon(Icons.home, color: darkGreen),
              label: Text('الصفحة الرئيسية'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.person_add_outlined, color: darkGreen),
              selectedIcon: Icon(Icons.person_add, color: darkGreen),
              label: Text('اضافة عامل'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.edit, color: darkGreen),
              selectedIcon: Icon(Icons.edit_outlined, color: darkGreen),
              label: Text('تعديل'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.person_remove_outlined, color: darkGreen),
              selectedIcon: Icon(Icons.person_remove, color: darkGreen),
              label: Text('ارشفة عامل'),
            ),
            
          ],
        ),
      ],
    );
  }
}
