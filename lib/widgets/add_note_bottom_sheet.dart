

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/widgets/custom_botton.dart';
import 'package:notes_app/widgets/custom_text_field.dart';


class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: AddNoteForm()
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidatemode = AutovalidateMode.disabled;
  String? title,subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child:  Column(
            children: [
             
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomTextField(labelTxt: 'Title',onSaved: (value) {
                  title = value;
                },),
              ),
              CustomTextField(labelTxt: 'Description',maxLines: 5,onSaved: (value) {
                subTitle = value;
              },),
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomButton(
                  ontap: () {
                    if(formkey.currentState!.validate()){
                        formkey.currentState!.save();
                    }else{
                      autovalidatemode = AutovalidateMode.always;
                      setState(() {
                        
                      });
                    }
                  },
                ),
              )
            ],
          ),
    );
  }
}

