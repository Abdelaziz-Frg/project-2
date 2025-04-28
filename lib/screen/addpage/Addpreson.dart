import 'package:flutter/material.dart';
import 'package:personnel_managment/compenent/color.dart';
import 'package:personnel_managment/widget/selctedpage.dart';
import 'package:personnel_managment/widget/text.dart';
import 'package:personnel_managment/widget/time.dart';
import 'package:personnel_managment/compenent/jobpositions.dart';

class Addpreson extends StatefulWidget {
  const Addpreson({super.key});

  @override
  State<Addpreson> createState() => _AddpresonState();
}

class _AddpresonState extends State<Addpreson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: lightGreen, body: addbody());
  }
}







class addbody extends StatefulWidget {
  const addbody({super.key});

  @override
  State<addbody> createState() => _addbodyState();
}

class _addbodyState extends State<addbody> {

  TextEditingController text_nom = TextEditingController();
  TextEditingController text_prenom = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? _selectedValue ;

    return LayoutBuilder(
      builder: (context, con) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                color: lightGreen,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: con.maxHeight / 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Textwdget(
                            labletext: "اللقب",
                            hei: con.maxHeight / 30,
                            wid: con.maxWidth / 4,
                            textcontroller: text_nom,
                          ),
                          Textwdget(
                            textcontroller: text_prenom,
                            labletext: "الاسم",
                            hei: con.maxHeight / 30,
                            wid: con.maxWidth / 4,
                          ),
                        ],
                      ),

                      SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Timewidget(
                            labletext: "تاريخ الميلاد",
                            hei: con.maxHeight / 30,
                            wid: con.maxWidth / 4,
                          ),
                          Timewidget(
                            labletext: "تاريخ التعيين",
                            hei: con.maxHeight / 30,
                            wid: con.maxWidth / 4,
                          ),
                          // Timewidget(
                          //   labletext: "تاريخ السريان",
                          //   hei: con.maxHeight / 30,
                          //   wid: con.maxWidth / 4,
                          // ),
                        ],
                      ),

                      SizedBox(height: 40),

                      Container(
                        height: con.maxHeight / 30,
                        width: con.maxWidth / 3,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 10,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: darkGreen,
                                  width: 1.2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: darkGreen,
                                  width: 1.4,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ), 
                                borderSide: BorderSide(color: darkGreen),
                              ),
                            ),
                            isExpanded: true,
                            hint: Text(
                              'منصب الشغل',
                              textAlign: TextAlign.right,
                            ),
                            value: _selectedValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedValue = newValue;
                              });
                            },
                            items:
                                job.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(
                                      option,
                                      textAlign: TextAlign.right,
                                    ),
                                  );
                                }).toList(),
                          ),
                        ),
                      ),

                      SizedBox(height: 40),
                      
                      Text("${text_nom.text}"),

                      Container(
                        height: con.maxHeight / 30,
                        width: con.maxWidth / 3,
                        child: ElevatedButton(onPressed: (){
                        setState(() {
                        });
                      }, child: Text("اضافة" , style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkGreen,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      ),)),
                    ],
                  ),
                ),
              ),
            ),
            selctedpage(selectedIndex: 1),
          ],
        );
      },
    );
  }
}
