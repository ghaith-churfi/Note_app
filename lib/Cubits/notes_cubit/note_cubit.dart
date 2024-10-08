import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/models/note_model.dart';

part 'note_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(super.initialState);
  List<NoteModel>? notes;
  fetchAllNotes() {
    emit(NotesLoading());
    var notesBox = Hive.box<NoteModel>(noteBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
