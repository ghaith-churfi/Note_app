import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hinttext,
      required this.fill,
      this.maxlines = 1,
      this.icon,
      this.onSaved,
      this.onChanged});
  final void Function(String)? onChanged;
  final int maxlines;
  final String hinttext;
  final Widget? icon;
  final bool fill;
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "This feild is required";
          } else {
            return null;
          }
        },
        maxLines: maxlines,
        decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(.3),
          filled: fill,
          prefixIcon: icon,
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
          border: const OutlineInputBorder(),
          enabledBorder: OutLineInputBorder(),
          focusedBorder: OutLineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder OutLineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.white.withOpacity(.1)));
  }
}
