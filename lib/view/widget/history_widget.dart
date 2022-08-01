import 'package:flutter/material.dart';
import 'package:proj2_bmi/model/bmiModel.dart';
import 'package:provider/provider.dart';

class HistoryWidget extends StatelessWidget {
  BmiModel bmiModel;

  HistoryWidget(this.bmiModel);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, provider, x) {
      return Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                children: [
                  // Text("${bmiModel.height!} cm"),
                  // Text("${bmiModel.weight!} kg"),
                  // Text(bmiModel.bmiStatus!),
                  // Text("${bmiModel.bmiScore!}"),

                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: bmiModel.bmiColor! as Color,
                        radius: 7,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(bmiModel.bmiStatus!),
                      Text("${bmiModel.bmiScore!}"),
                    ],
                  ),
                  Row(children: [
                    Text("${bmiModel.height!} cm"),
                    Text("${bmiModel.weight!} kg"),
                  ],),
                ],
              ),
             Text("${bmiModel.bmiDate!} cm"),
            ],
          ),
        ),
      );
    });
  }
}
