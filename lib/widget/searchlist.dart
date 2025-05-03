import 'package:flutter/material.dart';
import 'package:personnel_managment/compenent/color.dart';

class Searchcard extends StatefulWidget {
  final String? nom;
  final String? bday;
  Searchcard({super.key, required this.nom , required this.bday});

  @override
  State<Searchcard> createState() => _SearchcardState();
}

class _SearchcardState extends State<Searchcard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[200],
      child:
      // ListTile(
      //   leading: Text('${widget.nom}', style: TextStyle(fontSize: 16)),
      // ),
      Container(
        height: 40,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${widget.nom}', style: TextStyle(fontSize: 16)),
            Text('تاريخ الميلاد ${widget.bday}' , style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
