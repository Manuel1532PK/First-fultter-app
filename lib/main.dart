import 'package:flutter/material.dart';
import 'package:imc_calculetor/core/app_color.dart';
import 'package:imc_calculetor/screens/Imc_home_screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //Esqueleto de la App
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          foregroundColor: Colors.white,
          title: Text("IMC calculator"),
        ),
        backgroundColor: AppColor.background,
        body: ImcHomeScreen(),
      ),
    );
  }
}
