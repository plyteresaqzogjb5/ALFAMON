import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RateUsDialog extends StatefulWidget {
  final ThemeData theme;

  const RateUsDialog({super.key, required this.theme});

  @override
  State<RateUsDialog> createState() => _RateUsDialogState();
}

class _RateUsDialogState extends State<RateUsDialog> {
  int _selectedStars = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Please rate us 5 stars on the application website',
        style: widget.theme.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(top: 20, bottom: 10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.theme.colorScheme.background,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedStars = index + 1;
                });
              },
              child: Icon(
                Icons.star,
                size: 40,
                color: index < _selectedStars
                    ? const Color.fromRGBO(255, 219, 102, 1)
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, _selectedStars);
          },
          child: Text(
            '$_selectedStars stars',
            style: widget.theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: widget.theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: widget.theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

void showRateUsDialog(BuildContext context, ThemeData theme) {
  
  showDialog(
    context: context,
    builder: (context) => RateUsDialog(theme: theme),
  );
}
