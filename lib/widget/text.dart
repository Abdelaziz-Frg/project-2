import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personnel_managment/compenent/color.dart';

class Textwdget extends StatefulWidget {
  TextEditingController textcontroller;
  final String labletext;
  final double wid;
  final double hei;

  Textwdget({
    super.key,
    required this.labletext,
    required this.hei,
    required this.wid,
    required this.textcontroller,
  });

  @override
  State<Textwdget> createState() => _TextwdgetState();
}

class _TextwdgetState extends State<Textwdget> {
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.hei,
      width: widget.wid,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
            labelText: widget.labletext,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkGreen, width: 1.2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkGreen, width: 1.4),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          onChanged: (value) {
            widget.textcontroller.text = value;
            setState(() {
              
            });
          },
        ),
      ),
    );
  }
}
