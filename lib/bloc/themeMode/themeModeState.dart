part of "themeModeBloc.dart";

abstract class ThemeModeState extends Equatable {}

class InitialThemeModeState extends ThemeModeState {
  InitialThemeModeState();
  @override
  List<Object?> get props => [];
}

class GetThemeModeState extends ThemeModeState {
  final bool isLightMode;
  GetThemeModeState({required this.isLightMode});
  @override
  List<Object?> get props => [isLightMode];
}
