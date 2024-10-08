import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/notes_cubit/note_cubit.dart';

import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/Widget/custom_note_button.dart';
import 'package:note_app/views/Widget/custom_text_field.dart';

class EditeNoteBody_veiw extends StatefulWidget {
  const EditeNoteBody_veiw({super.key, required this.note});

  final NoteModel note;
  @override
  State<EditeNoteBody_veiw> createState() => _EditeNoteBody_veiwState();
}

class _EditeNoteBody_veiwState extends State<EditeNoteBody_veiw> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 39, 14, 54),
        body: SingleChildScrollView(
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
                      icon: const Icon(Icons.arrow_back)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                fill: false,
                hinttext: widget.note.title,
                onChanged: (newnoteTitle) {
                  title = newnoteTitle;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                fill: false,
                hinttext: widget.note.subtitle,
                onChanged: (newnoteSubtitle) {
                  subtitle = newnoteSubtitle;
                },
                maxlines: 5,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomNoteButton(
                text: "Edite",
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subtitle = subtitle ?? widget.note.subtitle;
                  print("${widget.note.title} == ${widget.note.subtitle}");
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
//   Edite_Button() {
//     return SizedBox(
//       width: 150,
//       child: MaterialButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         onPressed: () {
//           BlocProvider.of<NotesCubit>(context).fetchAllNotes();
//         },
//         color: const Color.fromARGB(255, 154, 15, 234),
//         child: const Text("Edite"),
//       ),
//     );
//   }
// }
