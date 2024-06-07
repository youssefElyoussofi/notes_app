

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/widgets/custom_botton.dart';
import 'package:notes_app/widgets/custom_text_field.dart';


class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
           
            
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CustomTextField(labelTxt: 'Title',),
            ),
            CustomTextField(labelTxt: 'Description',maxLines: 5,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(),
            )
          ],
        ),
      ),
    );
  }
}

