import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding:  EdgeInsets.only(left: 15,right: 15,bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {
              print('failed ${state.error}');
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
              BlocProvider.of<NotesCubitCubit>(context).fetchNotes();
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: const SingleChildScrollView(child: AddNoteForm()));
          },
        ),
      ),
    );
  }
}
