

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';


class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
   String? title,content;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        CustomAppbar(title: 'Edit Note', icon: Icons.check,onPressed: () {
          widget.note.title = title ?? widget.note.title;
          widget.note.subTitle = content ?? widget.note.subTitle;
          widget.note.save();
          BlocProvider.of<NotesCubitCubit>(context).fetchNotes();
          Navigator.pop(context);
        },),
       Padding(
        padding: const EdgeInsets.only(top: 50,bottom: 20),
        child: CustomTextField(
          onChanged: (value) {
            title = value;
          },
          labelTxt: widget.note.title),
      ),
       CustomTextField(
        
        onChanged: (value) {
          content = value;
        },
        labelTxt: widget.note.subTitle,maxLines: 5,),
        
      ],),
    );
  }
}