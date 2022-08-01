import 'package:proj2_bmi/data/db_helper.dart';

class BmiModel {
  int? id;
  String? height;
  String? weight;
  String? bmiStatus;
  // String? bmiColor;
  // String? bmiDate;
  int? bmiScore;
  BmiModel({
    required this.height,
    required this.weight,
    required this.bmiStatus,
    required this.bmiScore,
    // required this.bmiColor,
    // required this. bmiDate,
  });

  BmiModel.fromMap(Map<String, dynamic> map) {
    id = map[DbHelper.userIdColumName];
    height = map[DbHelper.userHeightColumName];
    weight = map[DbHelper.userWeightColumName];
    bmiStatus = map[DbHelper.userBmiStatusColumName];
    bmiScore = map[DbHelper.userBmiScoreColumName];

    // bmiColor = map[DbHelper.userBmiColorColumName];
    // bmiDate = map[DbHelper.userBmiDateColumName];

  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.userHeightColumName: height,
      DbHelper.userWeightColumName: weight,
      DbHelper.userBmiStatusColumName:bmiStatus,
      DbHelper.userBmiScoreColumName:  bmiScore,
      //
      // DbHelper.userBmiColorColumName:bmiColor,
      // DbHelper.userBmiDateColumName:  bmiDate,
    };


  }
  // Map<String,dynamic> toMap(){
  //   Map<String,dynamic> map=Map<String,dynamic>();
  //   map[DbHelper.userHeightColumName]= height;
  //   map[DbHelper.userWeightColumName]=weight;
  //   map[DbHelper.userBmiStatusColumName]=    bmiStatus;
  //   map[DbHelper.userBmiScoreColumName]= bmiScore;
  //   return map;
  // }
}
