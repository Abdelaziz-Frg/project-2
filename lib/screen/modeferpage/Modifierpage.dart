import 'package:flutter/material.dart';
import 'package:personnel_managment/compenent/color.dart';
import 'package:personnel_managment/compenent/datatest.dart';
import 'package:personnel_managment/compenent/employee.dart';
import 'package:personnel_managment/compenent/jobpositions.dart';
import 'package:personnel_managment/widget/searchlist.dart';
import 'package:personnel_managment/widget/selctedpage.dart';
import 'package:personnel_managment/widget/text.dart';
import 'package:personnel_managment/widget/time.dart';

class Modifierpage extends StatefulWidget {
  const Modifierpage({super.key});

  @override
  State<Modifierpage> createState() => _ModifierpageState();
}

class _ModifierpageState extends State<Modifierpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: lightGreen, body: bodymodifier());
  }
}

class bodymodifier extends StatefulWidget {
  const bodymodifier({super.key});

  @override
  State<bodymodifier> createState() => _bodymodifierState();
}

class _bodymodifierState extends State<bodymodifier> {
  TextEditingController text_nom = TextEditingController();
  TextEditingController searchtext = TextEditingController();
  TextEditingController text_prenom = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthDate = TextEditingController();
  TextEditingController _firstAppointmentDate = TextEditingController();
  TextEditingController _currentAppointmentDate = TextEditingController();
  String _position = 'مهندس';
  int _degree = 1;
  TextEditingController _degree2 = TextEditingController();
  TextEditingController _positionSeniorityController = TextEditingController(
    text: '0.0',
  );
  TextEditingController _directorPointsController = TextEditingController(
    text: '0.0',
  );
  TextEditingController _trainingPointsController = TextEditingController(
    text: '0.0',
  );
  String? _selectedValue;
  List Data2 = [];
  // List Data = [
  //   {'nom': 'عبد العزيز'},
  // ];
  bool page = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, con) {
        final double hauteur = con.maxHeight / 30;
        return Row(
          children: [
            selctedpage(selectedIndex: 1),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          onChanged: (value) {
                            Search();
                            setState(() {
                              page = false;
                            });
                          },
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          controller: searchtext,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: " بحث",
                            prefixIcon: IconButton(
                              onPressed: () {
                                onclick();
                                page = true;
                                setState(() {});
                              },
                              icon: Icon(Icons.search, color: darkGreen),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF595959),
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
                          ),
                        ),
                      ),
                      page == true
                          ? Column(
                            children: [
                              SizedBox(height: con.maxHeight / 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            borderSide: BorderSide(
                                              color: darkGreen,
                                            ),
                                          ),
                                        ),
                                        isExpanded: true,
                                        hint: Text(
                                          'منصب الشغل',
                                          textAlign: TextAlign.right,
                                        ),
                                        value:
                                            job.contains(_selectedValue)
                                                ? _selectedValue
                                                : null,
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
                                ],
                              ),

                              SizedBox(height: 40),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Textwdget2(
                                    labletext: "الدرجة",
                                    hei: hauteur,
                                    wid: con.maxWidth / 5,
                                    textcontroller: _degree2,
                                  ),
                                  Textwdget2(
                                    textcontroller: _directorPointsController,
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

                              Text("${text_nom.text}"),
                            ],
                          )
                          // : SizedBox.shrink(),
                          : Container(
                            color: Colors.white,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: Data2.length,
                              itemBuilder: (context, i) {
                                return Data2.isEmpty
                                    ? Container()
                                    : InkWell(
                                      onTap: () {
                                        copyinfo(Data2[i]);

                                        page = true;
                                        setState(() {});
                                      },
                                      child: Searchcard(
                                        nom: Data2[i].name!,
                                        bday:
                                            Data2[i].birthDate.toString().split(
                                              ' ',
                                            )[0],
                                      ),
                                    );
                              },
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

  // void copyinfo(Employee e) {
  //   _birthDate.text = e.birthDate.toString();
  //   _currentAppointmentDate.text = e.currentAppointmentDate.toString();
  //   List<String> parts = e.name.split(' ');
  //   text_prenom.text = parts.first;
  //   text_nom.text = parts.skip(1).join(' ');
  //   _selectedValue = e.position;
  //   _firstAppointmentDate.text = e.firstAppointmentDate.toString();
  //   _degree = e.degree;
  // }

  void copyinfo(Employee e) {
    setState(() {
      _idController.text = e.id;
      _birthDate.text = e.birthDate.toString().split(' ')[0];
      _currentAppointmentDate.text =
          e.currentAppointmentDate.toString().split(' ')[0];
      List<String> parts = e.name.split(' ');
      text_prenom.text = parts.first;
      text_nom.text = parts.skip(1).join(' ');
      _selectedValue = e.position;
      _firstAppointmentDate.text =
          e.firstAppointmentDate.toString().split(' ')[0];
      _degree = e.degree;
      _degree2.text = e.degree.toString();
    });
  }

  void Search() {
    if (searchtext.text.trim().isEmpty) {
      setState(() {
        Data2.clear();
      });
    } else {
      setState(() {
        Data2 =
            Data.where((item) {
              String nom = item.name.toLowerCase();
              return nom.startsWith(searchtext.text.toLowerCase());
            }).toList();
      });
    }
  }

  void onclick() {
    if (searchtext.text.isEmpty) {
      page = false;
    } else {
      page = Data2.isNotEmpty;
      setState(() {});
    }
  }
}

class timet extends StatefulWidget {
  final String labletext;
  final double wid;
  final double hei;
  final DateTime initialTime;

  timet({
    super.key,
    required this.labletext,
    required this.hei,
    required this.wid,
    required this.initialTime,
  });

  @override
  State<timet> createState() => _timetState();
}

class _timetState extends State<timet> {
  TextEditingController _dateController = TextEditingController();

  _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1962),
      lastDate: DateTime(3000),
    );

    if (selectedDate != null && selectedDate != DateTime.now()) {
      setState(() {
        _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.hei,
      width: widget.wid,
      child: TextFormField(
        controller: _dateController,
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
