import 'package:ezcountries/model/country_model.dart';

class CountryState {

  List<CountryModel>? countryList = [];
  List<CountryModel>? countrySearchList = [];
  bool? isLoading = false;

  CountryState({this.countryList, this.countrySearchList, this.isLoading});

  CountryState copyWith ({
    List<CountryModel>? countryList,
    List<CountryModel>? countrySearchList,
    bool? isLoading,
   }) {
     return CountryState(
        countryList: countryList ?? this.countryList,
        countrySearchList: countrySearchList ?? this.countrySearchList,
        isLoading: isLoading ?? this.isLoading,
     );
  }
}