import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/Cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/Cubits/notes_cubit/note_cubit.dart';
import 'package:note_app/bloc_observer.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/notes_view_body.dart';
import 'views/Widget/floating_actionbutton.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>(noteBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit(AddNoteInitial())),
        BlocProvider(
          create: (context) => NotesCubit(NotesInintial()),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          floatingActionButton: FloatingActionbutton(),
          backgroundColor: Color.fromARGB(255, 39, 14, 54),
          body: Notes_View_body(),
        ),
      ),
    );
  }
}
