import 'package:flutter/material.dart';
import 'package:proj2_bmi/data/db_helper.dart';
import 'package:proj2_bmi/model/bmiModel.dart';
class DbProvider extends ChangeNotifier {
  DbProvider() {
    selectAllHistory();
  }
  List<BmiModel> allHsitory = [];

  fillLists(List<BmiModel> bmis) {
    allHsitory = bmis;
    notifyListeners();
  }

  addTaskToList(BmiModel bmiModel) {
    allHsitory.add(bmiModel);
    fillLists(allHsitory);
  }

  createNewHistory(BmiModel bmiModel) async {
    await DbHelper.dbHelper.insertNewBmi(bmiModel);
   // selectAllHistory();
    addTaskToList(bmiModel);
  }

  selectAllHistory() async {
    List<BmiModel> bmis = await DbHelper.dbHelper.selectAllHistory();
   fillLists(bmis);

  }

  deleteHistory(BmiModel bmiModel) async {
    await DbHelper.dbHelper.deleteOneHistory(bmiModel.id!);
    selectAllHistory();
  }

  updateTask(BmiModel bmiModel) async {

    //await DbHelper.dbHelper.updateOneTask(taskModel);
    selectAllHistory();
  }
}