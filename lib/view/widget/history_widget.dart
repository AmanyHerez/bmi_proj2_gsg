import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj2_bmi/model/bmiModel.dart';
import 'package:proj2_bmi/provider/db_provider.dart';
import 'package:provider/provider.dart';

class HistoryWidget extends StatelessWidget {
  BmiModel bmiModel;

  HistoryWidget(this.bmiModel);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, DbProvider provider, x) {
      return Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // CircleAvatar(
                      //   backgroundColor: bmiModel.bmiColor! as Color,
                      //   radius: 7,
                      // ),

                      Text(
                        bmiModel.bmiStatus!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Gabriela-Regular',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${bmiModel.bmiScore!}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Gabriela-Regular',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        " ${bmiModel.height!}cm ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Gabriela-Regular',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        " ${bmiModel.weight!}kg ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Gabriela-Regular',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    provider.deleteHistory(bmiModel);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              Text(bmiModel.bmiDate ?? " null".toString(), style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Gabriela-Regular',
              ),),
            ],
          ),
        ),
      );
    });
  }
}
