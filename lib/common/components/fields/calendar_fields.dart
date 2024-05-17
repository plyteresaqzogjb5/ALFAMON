import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:alfamon/common/helpers/show_custom_snack_bar.dart';

class CalendarFieldWidget extends StatefulWidget {
  const CalendarFieldWidget(
      {super.key, required this.controller, this.errorText});

  final TextEditingController controller;

  final String? errorText;

  @override
  State<CalendarFieldWidget> createState() => _CalendarFieldWidgetState();
}

class _CalendarFieldWidgetState extends State<CalendarFieldWidget> {
  DateTime selectedDate = DateTime.now();
  bool isShanged = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(selectedDate.year),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      DateTime nowWithoutTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );

      DateTime pickedDateWithoutTime = DateTime(
        picked.year,
        picked.month,
        picked.day,
      );
      if (pickedDateWithoutTime.isBefore(nowWithoutTime)) {
        // ignore: use_build_context_synchronously
        showCustomSnackBar(
            // ignore: use_build_context_synchronously
            context, 'You cannot select select dates in the past');
        setState(() {
          selectedDate = DateTime.now();
          isShanged = false;
          widget.controller.text = '00.00.0000';
          selectedDate = DateTime.now();
          isError = true;
        });
      } else {
        setState(() {
          selectedDate = picked;
          isShanged = true;
          isError = false;
          widget.controller.text =
              DateFormat('dd.MM.yyyy').format(selectedDate.toLocal());
        });
      }
    } else {
      // ignore: use_build_context_synchronously
      showCustomSnackBar(context, 'Select date!');
      setState(() {
        selectedDate = DateTime.now();
        isShanged = false;
        widget.controller.text = '00.00.0000';
        selectedDate = DateTime.now();
        isError = true;
      });
    }
  }

  bool isFocused = false;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: TextFormField(
        showCursor: false,
        style: Theme.of(context).textTheme.titleMedium,
        decoration: InputDecoration(
          prefixIcon: Transform.scale(
            scale: 0.35,
            child: SvgPicture.asset(
              'assets/icons/calendar.svg',
            ),
          ),
          suffixIconConstraints: const BoxConstraints.tightFor(width: 50),
          hintText: widget.controller.text,
          errorText: isError ? 'Select date!' : null,
        ),
        validator: (value) {
          if (value == null || value.isEmpty || value == '00.00.0000') {
            setState(() {
              isError = true;
            });
            return 'Select date!';
          }
          return null;
        },
        controller: widget.controller,
        enableInteractiveSelection: false,
        onTap: () {
          setState(() {
            _selectDate(context);
            // if (widget.controller.text == null ||
            //     widget.controller.text.isEmpty ||
            //     widget.controller.text == '00.00.0000') {
            //   isError = true;
            // }
            isFocused = true;
          });
        },
        onFieldSubmitted: (value) {
          setState(() {
            // if (widget.controller.text == null ||
            //     widget.controller.text.isEmpty ||
            //     widget.controller.text == '00.00.0000') {
            //   isError = true;
            // }
            isFocused = false;
          });
        },
        onChanged: (value) {
          setState(() {
            //   if (widget.controller.text == null ||
            //       widget.controller.text.isEmpty ||
            //       widget.controller.text == '00.00.0000') {
            //     isError = true;
            //   }
            isFocused = false;
          });
        },
      ),
    );
  }
}
