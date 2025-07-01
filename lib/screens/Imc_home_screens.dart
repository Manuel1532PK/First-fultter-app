import 'package:flutter/material.dart';
import 'package:imc_calculetor/components/gender_selector.dart';
import 'package:imc_calculetor/components/height_selector.dart';
import 'package:imc_calculetor/components/number_selector.dart';
import 'package:imc_calculetor/core/app_color.dart';
import 'package:imc_calculetor/core/text_style.dart';
import 'package:imc_calculetor/screens/imc_result_screens.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedWeight = 80;
  int selectedAge = 20;
  double selectedHeight = 160;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          selectedHeight: selectedHeight,
          onHeightChange: (newHeight) {
            setState(() {
              selectedHeight = newHeight;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "Peso",
                  value: selectedWeight,
                  onDescrement: () {
                    setState(() {
                      selectedWeight--;
                    });
                  },
                  onIncrement: () {
                    setState(() {
                      selectedWeight++;
                    });
                  },
                ),
              ),

              SizedBox(width: 16),

              Expanded(
                child: NumberSelector(
                  title: "Edad",
                  value: selectedAge,
                  onDescrement: () {
                    setState(() {
                      selectedAge--;
                    });
                  },
                  onIncrement: () {
                    setState(() {
                      selectedAge++;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImcResultScreens(
                      height: selectedHeight,
                      weight: selectedWeight,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColor.primary),
              ),
              child: Text("Calacular", style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
