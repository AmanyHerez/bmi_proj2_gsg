import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:proj2_bmi/view/screen/score_screen.dart';
import 'package:intl/intl.dart';
import '../widget/custome_textfield.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var bmiScore;
  String? status;
  int? height;
  int? weight;
  TextEditingController heightController = TextEditingController();

  TextEditingController weightController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  GlobalKey<FormState> bmikey = GlobalKey();

  validationHeight(value) {
    if (value.isEmpty) {
      return 'please enter your height';
    }
    // if(value< 0){
    //   return  int.parse('your height must be positive mumber');
    //   //'your height must be positive mumber'
    // }
  }

  validationWeight(value) {
    if (value.isEmpty) {
      return 'please enter your Weight';
    }
    // else if(value< 0){
    //   return 'your height must be positive mumber';
    // }
  }

  CalculateBMI() {
    height = int.parse(heightController.value.text);
    weight = int.parse(weightController.value.text);
    bmiScore = (weight! / ((height! / 100) * (height! / 100))).toInt();
    // if (bmi >= 18.5 && bmi <= 25) {
    //   status = "Normal BMI";
    // } else if (bmi > 25 && bmi <= 30) {
    //   status = "Overweight";
    // } else if (bmi > 30) {
    //   status = "Obesity";
    // } else {
    //   status = "Under Weight";
    // }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: bmikey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/images/bg.png"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        if (context.locale.toString() == 'ar') {
                          context.setLocale(Locale('en'));
                        } else {
                          context.setLocale(Locale('ar'));
                        }
                      },
                      icon: Icon(Icons.language),
                    ),
                    Center(
                      child: Text(
                        "bmi_calculator".tr(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          fontFamily: 'Gabriela-Regular',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.15,
                        left: size.width * 0.06,
                        right: size.width * 0.06,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "height".tr(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              fontFamily: 'Gabriela-Regular',
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          CustomeTextField(
                              title: 'height_cm'.tr(),
                              controller: heightController,
                              inputType: TextInputType.number,
                              validator: validationHeight),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Weight".tr(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                fontFamily: 'Gabriela-Regular'),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          CustomeTextField(
                              title: 'Weight_kg'.tr(),
                              controller: weightController,
                              inputType: TextInputType.number,
                              validator: validationWeight),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Date".tr(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                fontFamily: 'Gabriela-Regular'),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          TextField(
                            controller: dateController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Gabriela-Regular',
                                ),
                                hintText: "Enter Date"),
                            readOnly: true,
                            //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate;
                              pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate);
                                setState(() {
                                  dateController.text = formattedDate;
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                          )
                          // TextFormField(
                          //   controller: dateController,
                          //   decoration: InputDecoration(
                          //       contentPadding: EdgeInsets.all(15),
                          //       hintText: 'Date'.tr(),
                          //       hintStyle: TextStyle(
                          //         fontSize: 14,
                          //         fontFamily: 'Gabriela-Regular',
                          //       ),
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(15),
                          //       )),
                          //   onTap: ()async{
                          //     DateTime date=DateTime.now();
                          //     DateTime? pickedDate=await showDatePicker(context: context, initialDate:date , firstDate: DateTime(2000), lastDate: DateTime(2100));
                          //     if(pickedDate== null)return;
                          //     setState(() {
                          //       date=pickedDate;
                          //     });
                          //   },
                          // ),
                          // CustomeTextField(
                          //     title: 'Date'.tr(),
                          //     controller: dateController,
                          //     inputType: TextInputType.datetime,
                          //     validator: validationWeight,
                          // //onTap:
                          //    ),
                          ,
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                bmikey.currentState!.validate();
                                CalculateBMI();
                                //save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ScoreScreen(
                                              bmiScore: bmiScore,
                                              height: heightController.text,
                                              weight: weightController.text,
                                              date: dateController.text,


                                            )));

                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFA557FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.all(13),
                              ),
                              child: Text(
                                'Calculate'.tr(),
                                style: TextStyle(
                                  fontFamily: 'Gabriela-Regular',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                          // Center(
                          //   child: Text(
                          //     bmi == null ? 'No Result' : bmi!.toString(),
                          //     style: const TextStyle(fontSize: 50),
                          //     textAlign: TextAlign.center,
                          //   ),
                          // ),
                          // Center(child: Text(status!)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
// Future<void> PerformSave() async{
//   save();
//   // clear();
// }
// Future<void> save() async{
// await  Provider.of<BmiProvider>(context,listen: false).create(bmi: bmi);
// }
// BmiModel get bmi{
//   return BmiModel(height: heightController.text, weight: weightController.text);
// }
// void clear(){
//   heightController.text=' ';
//   weightController.text=' ';
//
// }
}
