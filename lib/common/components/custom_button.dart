import 'package:pp_14_copy/common/styles/const_theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.active});
  final String text;
  final VoidCallback? onPressed;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: active ? onPressed : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.primaryColor,
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: active
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .color!
                        .withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
