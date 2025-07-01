import 'package:flutter/material.dart';
import 'package:imc_calculetor/core/app_color.dart';
import 'package:imc_calculetor/core/text_style.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender; //Si es null

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            //Permite la accion con el boton
            onTap: () {
              setState(() {
                //Dentro del setsate permite que las condicion se cumpla dentro del stateful
                selectedGender = 'Hombre';
              });
            },
            child: Padding(
              //Padding exterior
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                bottom: 16,
                right: 8,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == "Hombre"
                      ? AppColor.backgroundComponentSelected
                      : AppColor.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/male.png", height: 100),
                      SizedBox(height: 8),
                      Text("Hombre".toUpperCase(), style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            //Permite la accion con el boton
            onTap: () {
              setState(() {
                //Dentro del setsate permite que las condicion se cumpla dentro del stateful
                selectedGender = 'Mujer';
              });
            },
            child: Padding(
              //Padding exterior
              padding: const EdgeInsets.only(
                left: 9,
                top: 16,
                bottom: 16,
                right: 16,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == "Mujer"
                      ? AppColor.backgroundComponentSelected
                      : AppColor.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/female.png", height: 100),
                      SizedBox(height: 8),
                      Text("Mujer".toUpperCase(), style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
