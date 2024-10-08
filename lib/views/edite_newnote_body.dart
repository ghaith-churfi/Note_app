import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/Cubits/add_note_cubit/add_note_cubit.dart';

import 'package:note_app/Cubits/notes_cubit/note_cubit.dart';
import 'package:note_app/views/Widget/add_note_form.dart';

class EditenewNoteBody_veiw extends StatelessWidget {
  const EditenewNoteBody_veiw({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: BlocProvider(
        create: (context) => AddNoteCubit(AddNoteInitial()),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 39, 14, 54),
          body: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteFailure) {
                print("Failed ${state.ErrMessage}");
              }
              if (state is AddNoteSuccess) {
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return const ModalProgressHUD(
                  inAsyncCall: State is AddNoteLoading ? true : false,
                  child: SingleChildScrollView(child: AddNoteForm()));
            },
          ),
        ),
      ),
    );
  }
}
