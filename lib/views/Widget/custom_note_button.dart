import 'package:flutter/material.dart';

class CustomNoteButton extends StatelessWidget {
  const CustomNoteButton({super.key, this.onPressed, required this.text});
  final Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPressed,
        color: const Color.fromARGB(255, 154, 15, 234),
        child: Text(text),
      ),
    );
  }
}
