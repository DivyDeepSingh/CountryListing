part of "countryBloc.dart";

abstract class CountryEvent extends Equatable {}

class InitialCountryEvent extends CountryEvent {
  BuildContext context;
  InitialCountryEvent(this.context);
  @override
  List<Object?> get props => [];
}

class SearchCountryEvent extends CountryEvent {
  final String query;
  SearchCountryEvent(this.query);
  @override
  List<Object?> get props => [query];
}

class OnFilterCountryEvent extends CountryEvent {
  final String query;
  OnFilterCountryEvent(this.query);
  @override
  List<Object?> get props => [query];
}

class OnErrorEvent extends CountryEvent {
  final String errorMessage;
  OnErrorEvent(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class TryAgainEvent extends CountryEvent {
  TryAgainEvent();
  @override
  List<Object?> get props => [];
}
