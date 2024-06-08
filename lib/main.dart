import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/note_model.dart';



import 'package:notes_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('notes');
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const NotesView(),
    );
  }
}


