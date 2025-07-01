import 'package:flutter/material.dart';
import 'package:imc_calculetor/core/app_color.dart';
import 'package:imc_calculetor/core/text_style.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  final int value;
  final Function() onDescrement;
  final Function() onIncrement;

  const NumberSelector({
    super.key,
    required this.title,
    required this.value,
    required this.onDescrement,
    required this.onIncrement,
  });

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.backgroundComponent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(widget.title, style: TextStyles.bodyText),
          Text(
            widget.value.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  widget.onDescrement();
                },
                shape: CircleBorder(),
                backgroundColor: AppColor.primary,
                child: Icon(Icons.remove, color: Colors.white),
              ),
              SizedBox(width: 16),
              FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  widget.onIncrement();
                },
                shape: CircleBorder(),
                backgroundColor: AppColor.primary,
                child: Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
