import 'package:flutter/material.dart';
import 'package:imc_calculetor/core/app_color.dart';
import 'package:imc_calculetor/core/text_style.dart';

class ImcResultScreens extends StatelessWidget {
  final double height;
  final int weight;
  const ImcResultScreens({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: toolbarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedHeight = height / 100;
    double imcResult = weight / (fixedHeight * fixedHeight);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Tu resultado",
            style: TextStyle(
              fontSize: 38,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      TitleStateByImc(imcResult),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: getColorByImc(imcResult),
                      ),
                    ),
                    Text(
                      imcResult.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 76,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        DescriptionByImc(imcResult),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColor.primary),
              ),
              child: Text("Finalizar", style: TextStyles.bodyText),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text("Resultado"),
      backgroundColor: AppColor.primary,
      foregroundColor: Colors.white,
    );
  }

  Color getColorByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.blue, //IMC Najo
      < 24.9 => Colors.green, //IMC Normal
      < 29.99 => Colors.orange, //SobrePeso
      _ => Colors.red, //Obesidad
    };
  }

  String TitleStateByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "IMC Najo",
      < 24.9 => "IMC Normal",
      < 29.99 => "SobrePeso",
      _ => "Obesidad",
    };
  }

  String DescriptionByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Tienes que conseguir mayor volumen",
      < 24.9 => "Esta saludable, ¡sigue asi!",
      < 29.99 => "Estas por encima de la media de tu peso",
      _ => "Debes tomar una dieta",
    };
  }
}
