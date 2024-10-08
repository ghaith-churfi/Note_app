import 'package:flutter/material.dart';
import 'package:note_app/views/add_note_body.dart';

class FloatingActionbutton extends StatelessWidget {
  const FloatingActionbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(eccentricity: 0),
      backgroundColor: const Color.fromARGB(255, 154, 15, 234),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditenewNoteBody_veiw(),
            ));
      },
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }
}
