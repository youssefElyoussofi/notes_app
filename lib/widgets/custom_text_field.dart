import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.labelTxt, this.maxLines = 1});
  final String labelTxt;
  final int maxLines;
  
  @override
  Widget build(BuildContext context) {
    return  TextField(
      maxLines: maxLines,
      cursorColor: kprimaryColor,
      decoration: InputDecoration(
     
        hintText: labelTxt,
        hintStyle: const TextStyle(color: kprimaryColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kprimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return  OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: color?? Colors.white)
      );
  }
}