
import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: 15,
      itemBuilder: (context, index) {
        return const NoteItem();
      },);
  }
}