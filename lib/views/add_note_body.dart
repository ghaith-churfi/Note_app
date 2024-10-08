import 'package:flutter/material.dart';
import 'package:note_app/views/Widget/add_note_form.dart';

class EditenewNoteBody_veiw extends StatelessWidget {
  const EditenewNoteBody_veiw({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: const Scaffold(
        backgroundColor: Color.fromARGB(255, 39, 14, 54),
        body: SingleChildScrollView(child: AddNoteForm()),
      ),
    );
  }
}
