part of 'styles_bloc.dart';

sealed class StylesEvent extends Equatable {
  const StylesEvent();

  @override
  List<Object> get props => [];
}

class ChangeStylesEvent extends StylesEvent {
  final bool? isChangeTheme;

  const ChangeStylesEvent({required this.isChangeTheme});
}

class GetStylesEvent extends StylesEvent {}
