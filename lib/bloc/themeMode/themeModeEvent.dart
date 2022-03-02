part of "themeModeBloc.dart";

abstract class ThemeModeEvent extends Equatable {}

class InitialThemeModeEvent extends ThemeModeEvent {
  InitialThemeModeEvent();
  @override
  List<Object?> get props => [];
}

class SetThemeModeEvent extends ThemeModeEvent {
  SetThemeModeEvent();
  @override
  List<Object?> get props => [];
}
