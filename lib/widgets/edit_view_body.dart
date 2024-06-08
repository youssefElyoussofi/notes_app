

import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';


class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        CustomAppbar(title: 'Edit Note', icon: Icons.check,),
      Padding(
        padding: EdgeInsets.only(top: 50,bottom: 20),
        child: CustomTextField(labelTxt: 'Title'),
      ),
      CustomTextField(labelTxt: 'Content',maxLines: 5,),
        
      ],),
    );
  }
}