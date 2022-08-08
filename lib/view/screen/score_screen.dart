import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:proj2_bmi/model/bmiModel.dart';
import 'package:provider/provider.dart';

import '../../provider/db_provider.dart';

class ScoreScreen extends StatefulWidget {
  final int bmiScore;
  String height;
  String? date;
  String weight;

  //String? color;

  ScoreScreen({
    required this.bmiScore,
    required this.height,
    required this.weight,
    required this.date,
    //this.color,
  });

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFA557FF),
        title: Text(
          "BMI Score",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            fontFamily: 'Gabriela-Regular',
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Card(
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "your-score".tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  fontFamily: 'Gabriela-Regular',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PrettyGauge(
                gaugeSize: 300,
                minValue: 0,
                maxValue: 40,
                segments: [
                  GaugeSegment('Underweight'.tr(), 18.5, Colors.red),
                  GaugeSegment('Normal'.tr(), 6.4, Colors.green),
                  GaugeSegment('Overweight'.tr(), 5, Colors.orange),
                  GaugeSegment('Obese'.tr(), 10.1, Colors.pink),
                ],
                valueWidget: Text(
                  widget.bmiScore.toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 40, fontFamily: 'Gabriela-Regular'),
                ),
                currentValue: widget.bmiScore.toDouble(),
                needleColor: Colors.black,
              ),
              Text(
                bmiStatus ?? 'No_Result'.tr(),
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: bmiStatusColor!,
                    fontFamily: 'Gabriela-Regular'),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  bmiInterpretation!,
                  style: const TextStyle(
                      fontSize: 15, fontFamily: 'Gabriela-Regular'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  BmiModel bmiModel = BmiModel(
                    height: widget.height,
                    weight: widget.weight,
                    bmiStatus: bmiStatus,
                    bmiScore: widget.bmiScore,
                    // bmiColor: widget.color,
                    bmiDate: widget.date,
                  );
                  await Provider.of<DbProvider>(context, listen: false)
                      .createNewHistory(bmiModel);
                  Navigator.pushReplacementNamed(context, '/history_screen');
                },
                child: Text(
                  "save".tr(),
                  style: const TextStyle(
                      fontSize: 15, fontFamily: 'Gabriela-Regular'),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFA557FF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setBmiInterpretation() {
    if (widget.bmiScore > 30) {
      bmiStatus = 'Obese'.tr();
      bmiInterpretation = "Msg_Obese".tr();
      bmiStatusColor = Color(0xFFE91E63);
      // widget.color=bmiStatusColor.toString();

    } else if (widget.bmiScore >= 25) {
      bmiStatus = 'Overweight'.tr();
      bmiInterpretation = "Msg_Overweight".tr();
      bmiStatusColor = Color(0xFFFF9100);
      //widget.color=bmiStatusColor.toString();
    } else if (widget.bmiScore >= 18.5) {
      bmiStatus = 'Normal'.tr();
      bmiInterpretation = "Msg_Normal".tr();
      bmiStatusColor = Color(0xFF4CAF50);
      //widget.color=bmiStatusColor.toString();
    } else if (widget.bmiScore < 18.5) {
      bmiStatus = 'Underweight'.tr();
      bmiInterpretation = "Msg_Underweight".tr();
      bmiStatusColor = Color(0xFFF44336);
      //widget.color=bmiStatusColor.toString();
    }
  }
}
