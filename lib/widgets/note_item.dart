import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) {
          return const EditNoteView();
        },)
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(left: 10,top: 10),
        decoration: BoxDecoration(
          color:  Color(note.color),
          borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(note.title,style: const TextStyle(
                fontSize: 25,
                color: Colors.black),),
              subtitle:  Padding(
                
                padding:  const EdgeInsets.only(top: 5),
                child: Text(note.subTitle,style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.5)),),
              ),
              trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.black,size: 30,)),
            ),
             Padding(
              padding:  const EdgeInsets.only(right: 25,bottom: 10),
              child: Text(note.date,style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(0.4)),),
            )
          ],
        ),
      ),
    );

  }
}