

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_picker.dart';
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
      EditNoteListColor(note: widget.note,)  
      ],),
    );
  }
}

class EditNoteListColor extends StatefulWidget {
  const EditNoteListColor({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteListColor> createState() => _EditNoteListColorState();
}

class _EditNoteListColorState extends State<EditNoteListColor> {
  late int currentIndex;

  @override
  void initState() {
   currentIndex = kcolors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kcolors.length,
        itemBuilder: (context, index) {
          return  GestureDetector(
            onTap: () {
              widget.note.color = kcolors[index].value;
              currentIndex = index;
             
              setState(() {
                
              });
            },
            child: ColorItem(isActive: currentIndex == index, color: kcolors[index],));
        },
      ),
    );
  }
}