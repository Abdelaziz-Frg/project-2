import 'package:flutter/material.dart';
import 'package:personnel_managment/compenent/color.dart';
import 'package:personnel_managment/compenent/datatest.dart';
import 'package:personnel_managment/compenent/employee.dart';
import 'package:personnel_managment/widget/faile.dart';
import 'package:personnel_managment/widget/selctedpage.dart';
import 'package:personnel_managment/widget/succes.dart';
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

  TextEditingController _idController = TextEditingController();
  TextEditingController _degree = TextEditingController();
  TextEditingController _birthDate = TextEditingController();
  TextEditingController _firstAppointmentDate = TextEditingController();
  TextEditingController _currentAppointmentDate = TextEditingController();
  // String _position = 'مهندس';
  // int _degree = 1;
  TextEditingController _positionSeniorityController = TextEditingController(
    text: '0.0',
  );
  TextEditingController _directorPointsController = TextEditingController(
    text: '0.0',
  );
  TextEditingController _trainingPointsController = TextEditingController(
    text: '0.0',
  );
  List<int> test = [0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    String? _selectedValue;

    return LayoutBuilder(
      builder: (context, con) {
        double hauteur = con.maxHeight / 30;
        if (con.maxHeight < 700) {
          hauteur = 30;
        }
        return Row(
          children: [
            selctedpage(selectedIndex: 1),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: con.maxHeight / 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Textwdget(
                            textcontroller: text_prenom,
                            labletext: "الاسم",
                            hei: hauteur,
                            wid: con.maxWidth / 4,
                          ),
                          Textwdget(
                            labletext: "اللقب",
                            hei: hauteur,
                            wid: con.maxWidth / 4,
                            textcontroller: text_nom,
                          ),
                        ],
                      ),

                      SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Timewidget(
                            textcontroler: _birthDate,
                            labletext: "تاريخ الميلاد",
                            hei: hauteur,
                            wid: con.maxWidth / 4,
                          ),
                          Timewidget(
                            textcontroler: _firstAppointmentDate,
                            labletext: "تاريخ اول تعيين في الرتبة",
                            hei: hauteur,
                            wid: con.maxWidth / 4,
                          ),
                          Timewidget(
                            textcontroler: _currentAppointmentDate,
                            labletext: "تاريخ التعيين الحالي",
                            hei: hauteur,
                            wid: con.maxWidth / 4,
                          ),
                        ],
                      ),

                      SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Textwdget2(
                            textcontroller: _idController,
                            labletext: "رقم التعريف",
                            hei: hauteur,
                            wid: con.maxWidth / 4,
                          ),

                          Container(
                            height: hauteur,
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
                                    borderRadius: BorderRadius.circular(20),
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
                                    _selectedValue = newValue!;
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
                        ],
                      ),

                      SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Textwdget2(
                            labletext: "الدرجة",
                            hei: hauteur,
                            wid: con.maxWidth / 5,
                            textcontroller: _degree,
                          ),
                          Textwdget2(
                            textcontroller: _positionSeniorityController,
                            labletext: "نقاط الاقدمية في المنصب",
                            hei: hauteur,
                            wid: con.maxWidth / 5,
                          ),
                          Textwdget2(
                            textcontroller: _directorPointsController,
                            labletext: "نقطة المدير",
                            hei: hauteur,
                            wid: con.maxWidth / 5,
                          ),
                          Textwdget2(
                            textcontroller: _trainingPointsController,
                            labletext: "نقطة دورات التكوين",
                            hei: hauteur,
                            wid: con.maxWidth / 5,
                          ),
                        ],
                      ),
                      SizedBox(height: 40),


                      Container(
                        height: hauteur,
                        width: con.maxWidth / 3,
                        child: ElevatedButton(
                          onPressed: () {
                            test[0] = test_text(text_nom.text, 3);
                            test[1] = test_text(text_prenom.text, 3);
                            test[2] = test_text(_idController.text, 5);
                            // test[3] = test_text(_birthDate.text, 6);
                            // test[4] = test_text(_firstAppointmentDate.text, 6);
                            if (calcule(test) == 3) {
                              try {
                                Employee newEmployee = Employee(
                                  id: _idController.text,
                                  name: "${text_nom.text} ${text_prenom.text}",
                                  birthDate: DateTime.parse(_birthDate.text),
                                  firstAppointmentDate: DateTime.parse(
                                    _firstAppointmentDate.text,
                                  ),
                                  currentAppointmentDate: DateTime.parse(
                                    _currentAppointmentDate.text,
                                  ),
                                  position: _selectedValue.toString(),
                                  degree: int.parse(_degree.text),
                                  positionSeniorityPoints: double.parse(
                                    _positionSeniorityController.text,
                                  ),
                                  directorPoints: double.parse(
                                    _directorPointsController.text,
                                  ),
                                  trainingPoints: double.parse(
                                    _trainingPointsController.text,
                                  ),
                                );
                                print(newEmployee);
                                if (Data.any(
                                  (employee) =>
                                      employee.id == _idController.text,
                                )) {
                                  Faile.showSuccessDialog(
                                    context,
                                    "خطا",
                                    "الموظف موجود بالفعل",
                                  );
                                } else {
                                  Data.add(newEmployee);
                                  print("تمت إضافة الموظف بنجاح.");
                                  print(Data[0].name);
                                  Succes.showSuccessDialog(
                                    context,
                                    "تمت الإضافة",
                                    "تم إضافة الموظف بنجاح",
                                  );
                                }
                              } catch (e) {
                                Faile.showSuccessDialog(
                                  context,
                                  "خطا",
                                  "خطا في حقل المعلومات",
                                );
                              }
                            } else {
                              Faile.showSuccessDialog(
                                context,
                                "فشل",
                                "فشل عملية الاضافة تاكد من صحة المعلومات",
                              );
                            }
                            setState(() {});
                          },
                          child: Text(
                            "اضافة",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  int test_text(String s, int len) {
    if (s.length < len)
      return 0;
    else
      return 1;
  }

  int calcule(List<int> T) {
    int som = 0;
    for (int i = 0; i < T.length; i++) {
      if (T[i] == 1) {
        som += 1;
      }
    }
    return som;
  }
}
