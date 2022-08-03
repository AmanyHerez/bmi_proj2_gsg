import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  String title;
  TextEditingController controller = TextEditingController();
  TextInputType inputType;
  final Function validator;
  final Function? onTap;

  CustomeTextField({
    required this.title,
    required this.controller,
    required this.inputType,
    required this.validator,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: (value) => validator(value),
      onTap:() => onTap ,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:BorderSide(
            color: Color(0xFFA557FF),

          ),
        ),
          contentPadding: EdgeInsets.all(15),
          hintText: '$title',
          hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: 'Gabriela-Regular',
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}