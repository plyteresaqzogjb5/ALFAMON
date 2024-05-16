import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_14_copy/feature/app/main_page.dart';

class ConfirmationDialog extends StatelessWidget {
  final Function() onPressed;
  final ThemeData theme; // Параметр для хранения текущей темы

  const ConfirmationDialog({super.key, required this.onPressed, required this.theme});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoAlertDialog(
        
        title: Text(
          'Are you sure you want to get out?',
          style: theme.textTheme.titleLarge!.copyWith(
            
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Yes',
             style: theme.textTheme.titleLarge!.copyWith(
            
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPageWidget(),
                ),
              );
            },
          ),
          CupertinoDialogAction(
            onPressed: onPressed,
            child: Text(
              'Cancel',
              style: theme.textTheme.titleLarge!.copyWith(
            
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
            ),
          ),
        ],
      ),
    );
  }
}