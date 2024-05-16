import 'package:flutter/material.dart';

class NamesFieldWidget extends StatefulWidget {
  const NamesFieldWidget({
    super.key,
    required this.controller,
    required this.titleHint,
  });

  final TextEditingController controller;
  final String titleHint;

  @override
  State<NamesFieldWidget> createState() => _NamesFieldWidgetState();
}

class _NamesFieldWidgetState extends State<NamesFieldWidget> {
  bool isFocused = false;
  bool isError = false;

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
          errorText: isError ? 'Enter ${widget.titleHint}' : null,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        controller: widget.controller,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            setState(() {
              isError = true;
            });
            return 'Enter ${widget.titleHint}';
          }
          return null;
        },
        enableInteractiveSelection: false,
        onTap: () {
          setState(() {
            isFocused = true;
          });
        },
        // onFieldSubmitted: (value) {
        //   setState(() {
        //     if (value.isEmpty) {
        //       isError = true;
        //     }
        //     isFocused = false;
        //   });
        // },
        // onChanged: (value) {
        //   setState(() {
        //     isFocused = false;
        //   });
        // },
      ),
    );
  }
}
