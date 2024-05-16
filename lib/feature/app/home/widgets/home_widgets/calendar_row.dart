import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pp_14_copy/feature/app/manual/maunal_main.dart';

class CalendarRowWidgets extends StatelessWidget {
  final Function() onPressedCalendar;
  final String date;
  const CalendarRowWidgets({
    super.key,
    required this.onPressedCalendar,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onPressedCalendar,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              height: 43,
              child: Center(
                  child: Text(
                date,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
              )),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
            flex: 1,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ManualMainPage()));
              },
              child: Container(
                height: 43,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child:
                    Center(child: SvgPicture.asset('assets/icon/warning.svg')),
              ),
            ))
      ],
    );
  }
}
