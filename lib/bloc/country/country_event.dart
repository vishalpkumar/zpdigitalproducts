
abstract class CountryEvent {}

class FetchCountryList extends CountryEvent {}

class SearchCountry extends CountryEvent{
  String? searchValue;
  SearchCountry({this.searchValue});
}

class FetchSingleCountry extends CountryEvent {
  String? countryCode;
  FetchSingleCountry({this.countryCode});
}
