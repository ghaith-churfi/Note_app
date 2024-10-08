import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/Cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/Cubits/notes_cubit/note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/Widget/custom_note_button.dart';
import 'package:note_app/views/Widget/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            fill: false,
            hinttext: 'Title',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },
            fill: false,
            hinttext: 'Content',
            maxlines: 5,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomNoteButton(
            text: "Add new note",
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var CurrentDate = DateTime.now();
                var FormatedCurrentDate = DateFormat.yMEd().format(CurrentDate);
                NoteModel noteModel = NoteModel(
                    title: title!,
                    subtitle: subtitle!,
                    date: FormatedCurrentDate.toString(),
                    color: Colors.black.value);
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                context.read<NotesCubit>().fetchAllNotes();
                Navigator.pop(context);
                FocusScope.of(context).requestFocus(FocusNode());
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
        ],
      ),
    );
  }
}
