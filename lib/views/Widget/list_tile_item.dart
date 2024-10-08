import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/Cubits/notes_cubit/note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edite_note_body.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditeNoteBody_veiw(
                  note: note,
                ),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(.1)),
              color: Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                autofocus: false,
                title: Text(
                  note.title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    note.subtitle,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    size: 20,
                    FontAwesomeIcons.trash,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Alertdialoge(context);
                      },
                    );
                  },
                ),
                contentPadding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 10),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 10),
                child: Text(
                  note.date,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AlertDialog Alertdialoge(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          child: const Text(
            "Delete",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            note.delete();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.black),
            ))
      ],
      icon: const Icon(
        Icons.warning_rounded,
        color: Colors.red,
      ),
      backgroundColor: Colors.white,
      content: const Text("Are you sure you want to delete the note?.",
          style: TextStyle(
            color: Colors.black,
          )),
    );
  }
}
