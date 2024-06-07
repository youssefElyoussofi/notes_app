import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

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
          color: const Color(0xffffcc80),
          borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Text('Note Title',style: TextStyle(
                fontSize: 25,
                color: Colors.black),),
              subtitle:  Padding(
                
                padding: const EdgeInsets.only(top: 5),
                child: Text('Description Note with and Description',style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.5)),),
              ),
              trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.black,size: 30,)),
            ),
             Padding(
              padding: const EdgeInsets.only(right: 25,bottom: 10),
              child: Text('June 07 , 2024',style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(0.4)),),
            )
          ],
        ),
      ),
    );

  }
}