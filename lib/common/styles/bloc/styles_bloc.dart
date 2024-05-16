import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'styles_event.dart';
part 'styles_state.dart';

class StylesBloc extends Bloc<StylesEvent, StylesState> {
  StylesBloc() : super(StylesInitial()) {
    on<ChangeStylesEvent>((event, emit) async {
      saveToSharedPreferences(event.isChangeTheme!);
      bool isChangeTheme = await getFromSharedPreferences();
      emit(StylesInitial());
  
      emit(StylesChanged(isChangeTheme: isChangeTheme));
    });
    on<GetStylesEvent>((event, emit) async {
      bool isChangeTheme = await getFromSharedPreferences();

      emit(StylesInitial());
      emit(GetChangeTheme(isTheme: isChangeTheme));
    });
  }

  Future<void> saveToSharedPreferences(bool isChangeTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isChangeTheme', isChangeTheme);
  }

  Future<bool> getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isChangeTheme') ?? false;
  }
}
