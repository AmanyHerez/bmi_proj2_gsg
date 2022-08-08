import 'package:proj2_bmi/data/db_helper.dart';

class BmiModel {
  int? id;
  String? height;
  String? weight;
  String? bmiStatus;
  String? bmiDate;
  int? bmiScore;
  // String? bmiColor;

  BmiModel({
    required this.height,
    required this.weight,
    required this.bmiStatus,
    required this.bmiScore,
    required this.bmiDate,
    // required this.bmiColor,
  });

  BmiModel.fromMap(Map<String, dynamic> map) {
    id = map[DbHelper.userIdColumName];
    height = map[DbHelper.userHeightColumName];
    weight = map[DbHelper.userWeightColumName];
    bmiStatus = map[DbHelper.userBmiStatusColumName];
    bmiScore = map[DbHelper.userBmiScoreColumName];
    bmiDate = map[DbHelper.userBmiDateColumName];
    // bmiColor = map[DbHelper.userBmiColorColumName];
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.userHeightColumName: height,
      DbHelper.userWeightColumName: weight,
      DbHelper.userBmiStatusColumName: bmiStatus,
      DbHelper.userBmiScoreColumName: bmiScore,
      DbHelper.userBmiDateColumName:  bmiDate,
      //
      // DbHelper.userBmiColorColumName:bmiColor,
    };
  }

}
