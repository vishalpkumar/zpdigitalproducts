import 'package:ezcountries/model/country_model.dart';

class CountryState {

  List<CountryModel>? countryList = [];
  List<CountryModel>? countrySearchList = [];

  CountryState({this.countryList, this.countrySearchList});

  CountryState copyWith ({
    List<CountryModel>? countryList,
    List<CountryModel>? countrySearchList,
   }) {
     return CountryState(
        countryList: countryList ?? this.countryList,
        countrySearchList: countrySearchList ?? this.countrySearchList,
     );
  }
}