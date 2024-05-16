import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({
    super.key,
    required this.controller,
    required this.titleHint,
  });

  final TextEditingController controller;
  final String titleHint;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: TextFormField(
        style: Theme.of(context).textTheme.titleMedium,
        autofocus: true,
        cursorColor: Theme.of(context).colorScheme.shadow,
        decoration: InputDecoration(
          hintText: widget.titleHint,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        controller: widget.controller,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter ${widget.titleHint}';
          } else if (!isEmail(value)) {
            return 'Enter a valid email address';
          }
          return null;
        },
        enableInteractiveSelection: false,
        onTap: () {
          setState(() {
            isFocused = true;
          });
        },
        onFieldSubmitted: (value) {
          setState(() {
            isFocused = false;
          });
        },
        onChanged: (value) {
          setState(() {
            isFocused = false;
          });
        },
      ),
    );
  }

  bool isEmail(String value) {
    final emailRegex = RegExp(
      r'^[A-Za-z0-9._%+\-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
    );
    return emailRegex.hasMatch(value);
  }
}
