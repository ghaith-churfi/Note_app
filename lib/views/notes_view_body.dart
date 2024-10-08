import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/notes_cubit/note_cubit.dart';
import 'package:note_app/views/Widget/note_item.dart';

class Notes_View_body extends StatefulWidget {
  const Notes_View_body({super.key});

  @override
  State<Notes_View_body> createState() => _Notes_View_bodyState();
}

class _Notes_View_bodyState extends State<Notes_View_body> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Column(
        children: [SizedBox(height: 30), NoteItem()],
      ),
    )
        //backgroundColor: const Color.fromARGB(255, 206, 138, 133)
        ;
  }
}
