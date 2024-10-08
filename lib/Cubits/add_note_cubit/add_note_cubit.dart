import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/models/note_model.dart';

part "add_note_state.dart";

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit(super.initialState);

  addNote(NoteModel note)  {
    try {
      var notesBox = Hive.box<NoteModel>(noteBox);
       notesBox.add(note);
      emit(AddNoteSuccess());
      emit(AddNoteLoading());
    } catch (e) {
      emit(AddNoteFailure(ErrMessage: e.toString()));
    }
  }
}
