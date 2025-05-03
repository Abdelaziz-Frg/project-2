import 'dart:io';
import 'package:window_size/window_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personnel_managment/screen/Home%20page/home.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(1200, 700)); // ← الحد الأدنى
    setWindowMaxSize(Size.infinite); // ← لا يوجد حد أقصى
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
        locale: Locale('ar', ''), // اللغة الافتراضية
  supportedLocales: const [
    Locale('en', ''),
    Locale('ar', ''), // تأكد من تضمين العربية
  ],
  localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
      home: Homepage(),
    );
  }
}