part of "countryBloc.dart";

abstract class CountryState {}

class InitialCountryState extends CountryState {
  InitialCountryState();

  List<Object?> get props => [];
}

class CountryLoadedState extends CountryState {
  final String selectedCode;
  List<CountriesModel> countries;
  List<CountriesModel> sortedCountries;
  CountryLoadedState(
      {required this.selectedCode,
      required this.countries,
      required this.sortedCountries});
  List<Object?> get props => [countries, sortedCountries];
}

class NoCountryFoundState extends CountryState {
  String errorMessage;
  NoCountryFoundState({required this.errorMessage});

  List<Object?> get props => [errorMessage];
}
