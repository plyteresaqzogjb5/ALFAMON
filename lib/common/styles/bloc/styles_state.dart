part of 'styles_bloc.dart';

sealed class StylesState extends Equatable {
  const StylesState();

  @override
  List<Object> get props => [];
}

final class StylesInitial extends StylesState {}

final class StylesChanged extends StylesState {
  final bool isChangeTheme;
  const StylesChanged({required this.isChangeTheme});
}

final class GetChangeTheme extends StylesState {
  final bool isTheme;
  const GetChangeTheme({required this.isTheme});
}
