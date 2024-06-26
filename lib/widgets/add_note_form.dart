import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_picker.dart';
import 'package:notes_app/widgets/custom_botton.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidatemode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  void initState() {
    BlocProvider.of<NotesCubitCubit>(context).fetchNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CustomTextField(
              labelTxt: 'Title',
              onSaved: (value) {
                title = value;
              },
            ),
          ),
          CustomTextField(
            labelTxt: 'Description',
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10,left: 10),
            child: Text('Select Color',style: TextStyle(color: kprimaryColor),),
          ),
          const ColorsListView(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  ontap: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      var currentDate = DateTime.now();
                      var formatDate = DateFormat.yMd().format(currentDate);
                      var noteModel = NoteModel(
                          title: title!,
                          subTitle: subTitle!,
                          date: formatDate,
                          color: Colors.white.value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    } else {
                      autovalidatemode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

