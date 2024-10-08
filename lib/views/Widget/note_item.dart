import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/notes_cubit/note_cubit.dart';

import 'package:note_app/models/note_model.dart';

import 'list_tile_item.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          List<NoteModel> notes =
              BlocProvider.of<NotesCubit>(context).notes ?? [];
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTileItem(
                note: notes[index],
              );
            },
            itemCount: notes.length,
          );
        },
      ),
    );
  }
}
