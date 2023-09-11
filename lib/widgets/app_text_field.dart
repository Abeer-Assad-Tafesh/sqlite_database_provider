import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({Key? key, required this.hint, required this.prefixIcon, required this.textInputType}) : super(key: key);

  final String hint;
  final IconData prefixIcon;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: false,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          hintText: 'Name',
          prefixIcon: const Icon(Icons.person),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(color: Colors.blue)
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({Color color = Colors.grey}){
    return OutlineInputBorder(
      borderSide: BorderSide(
          width: 1,
          color: color
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
