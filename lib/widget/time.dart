import 'package:flutter/material.dart';
import 'package:personnel_managment/compenent/color.dart';

class Timewidget extends StatefulWidget {
  final String labletext;
  final double wid;
  final double hei;
  TextEditingController textcontroler;

  Timewidget({
    super.key,
    required this.labletext,
    required this.hei,
    required this.wid,
    required this.textcontroler,
  });

  @override
  State<Timewidget> createState() => _TimewidgetState();
}

class _TimewidgetState extends State<Timewidget> {
  // TextEditingController _dateController = TextEditingController();

  _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1962),
      lastDate: DateTime(3000),
      locale: const Locale('ar', ''),
    );

    if (selectedDate != null && selectedDate != DateTime.now()) {
      setState(() {
        widget.textcontroler.text = "${selectedDate.toLocal()}".split(' ')[0];
        widget.textcontroler.text = widget.textcontroler.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.hei,
      width: widget.wid,
      child: TextFormField(
        controller: widget.textcontroler,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.calendar_today, color: darkGreen),
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
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _selectDate(context);
        },
      ),
    );
  }
}
