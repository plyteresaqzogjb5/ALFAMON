import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alfamon/common/styles/bloc/styles_bloc.dart';

class ContainerChangedThemeWidget extends StatefulWidget {
  const ContainerChangedThemeWidget({super.key});

  @override
  State<ContainerChangedThemeWidget> createState() =>
      _ContainerChangedThemeWidgetState();
}

class _ContainerChangedThemeWidgetState
    extends State<ContainerChangedThemeWidget> {
  bool? switchValue = false;
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    BlocProvider.of<StylesBloc>(context).add(GetStylesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StylesBloc, StylesState>(listener: (context, state) {
      if (state is GetChangeTheme) {
        setState(() {
          switchValue = state.isTheme;
        });
      } else if (state is StylesChanged) {
        setState(() {
          switchValue = state.isChangeTheme;
        });
      }
    }, builder: (context, state) {
      return Container(
        width: double.infinity,
        height: 53,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            )),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset('assets/images/checkout_theme.png'),
                const SizedBox(width: 10),
                Text(
                  'Dark theme',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            CupertinoSwitch(
              activeColor: const Color.fromRGBO(129, 224, 35, 1),
              value: switchValue!,
              applyTheme: true,
              onChanged: (value) async {
                 BlocProvider.of<StylesBloc>(context)
                    .add(ChangeStylesEvent(isChangeTheme: !switchValue!));
   
               
              },
            )
          ],
        ),
      );
    });
  }
}
