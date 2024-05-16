// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class NumberFieldWidget extends StatefulWidget {
  NumberFieldWidget({
    super.key,
    required this.controller,
    required this.titleHint,
    this.color,
  });

  final TextEditingController controller;
  final String titleHint;
  Color? color;

  @override
  State<NumberFieldWidget> createState() => _NumberFieldWidgetState();
}

class _NumberFieldWidgetState extends State<NumberFieldWidget> {
  bool isFocused = false;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51, // Set a fixed height to accommodate error text
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
        autofocus: true,
        textAlign: TextAlign.center,
        cursorColor: Theme.of(context).colorScheme.shadow,
        decoration: InputDecoration(
          fillColor: widget.color ?? Theme.of(context).colorScheme.background,
          filled: true,
          suffixIconConstraints: const BoxConstraints.tightFor(width: 50),
          hintText: widget.titleHint,
          contentPadding: EdgeInsets.zero,
          hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
          errorText: isError ? 'Enter ${widget.titleHint}' : null,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        controller: widget.controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
        ],
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
        onFieldSubmitted: (value) {
          setState(() {
            if (value.isEmpty) {
              isError = true;
            }
            isFocused = false;
          });
        },
        maxLength: 9,
        onChanged: (value) {
          setState(() {
            isFocused = false;
          });
        },
      ),
    );
  }
}
