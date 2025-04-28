import 'package:flutter/material.dart';
import 'package:personnel_managment/compenent/color.dart';
import 'package:personnel_managment/widget/selctedpage.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selctedpage(selectedIndex: 0),
      backgroundColor: lightGreen,
      // drawer: draw(),
      // appBar: AppBar(),
    );
  }
}




// class draw extends StatefulWidget {
//   const draw({super.key});

//   @override
//   State<draw> createState() => _drawState();
// }

// class _drawState extends State<draw> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer();
//   }
// }



