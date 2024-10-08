part of 'note_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInintial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesSuccess extends NotesState {}
