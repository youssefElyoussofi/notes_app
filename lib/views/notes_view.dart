

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/custom_body.dart';


class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   
      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimaryColor,
        onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            )),
          context: context, builder: (context) {
          return const NoteBottomSheet();
        },);
      },child: const Icon(Icons.add,color: Colors.black,),),
      body: const CustomBody(),
    );
  }
}


