part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

final class CreatedBalance extends SettingsState {}

final class SettingsError extends SettingsState {
  final Failure failure;

  const SettingsError({required this.failure});
}
