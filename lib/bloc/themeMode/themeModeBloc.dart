import 'package:country_sorting/providers/themeProvider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'themeModeEvent.dart';
part 'themeModeState.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  bool isLightMode = true;
  ThemeModeBloc() : super(InitialThemeModeState()) {
    on<InitialThemeModeEvent>((event, emit) async {
      isLightMode = await ThemeProvider().getTheme();
      emit(GetThemeModeState(isLightMode: isLightMode));
    });

    on<SetThemeModeEvent>((event, emit) async {
      isLightMode = await ThemeProvider().saveTheme(value: !isLightMode);
      emit(InitialThemeModeState());
      emit(GetThemeModeState(isLightMode: isLightMode));
    });
  }
}
