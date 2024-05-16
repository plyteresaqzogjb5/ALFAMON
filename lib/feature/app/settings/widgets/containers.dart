import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  final Function() onPressed;
  final String pathIcon;
  final String title;
  const SettingsContainer({
    super.key,
    required this.onPressed,
    required this.pathIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 53,
        // decoration: BoxDecoration(
        //     color: Theme.of(context).colorScheme.secondary,
        //     borderRadius: const BorderRadius.all(
        //       Radius.circular(10),
        //     )),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(pathIcon),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Theme.of(context).colorScheme.shadow,
            )
          ],
        ),
      ),
    );
  }
}
