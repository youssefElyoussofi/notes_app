

import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';


class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        CustomAppbar(title: 'Edit Note', icon: Icons.check,),
     
        
      ],),
    );
  }
}