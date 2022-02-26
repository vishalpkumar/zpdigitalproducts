import 'package:ezcountries/bloc/country/country_event.dart';
import 'package:ezcountries/bloc/country/country_state.dart';
import 'package:ezcountries/model/country_model.dart';
import 'package:ezcountries/services/graphql_query.dart';
import 'package:ezcountries/services/services.dart';
import 'package:ezcountries/untils/api.dart';
import 'package:ezcountries/untils/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState>{

  CountryBloc() : super(CountryState());

  GraphqlQuery graphqlQuery = GraphqlQuery();
  Services services = Services();
  List<CountryModel> countryList = [];

  @override
  Stream<CountryState> mapEventToState (CountryEvent event) async* {

    if(event is FetchCountryList){
      countryList = [];
      yield state.copyWith(countryList: countryList);
      String query =  graphqlQuery.country();
      var res =  await services.postGraphqlQuery(url: API.COUNTRY_LIST, query: query);
      if(res !=  "error"){
        countryList =  fromJsonToCountry(res['data']['countries']);
        yield state.copyWith(countryList: countryList);
        yield state.copyWith(countrySearchList: countryList);
      }else{
        Fluttertoast.showToast(
            msg: Constant.someThingWentWrong,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0
        );
      }

    }

    else if(event is SearchCountry){
      if(event.searchValue!.isNotEmpty){
            List<CountryModel> tempList =  state.countrySearchList!.where((list) => list.code!.toString().toLowerCase().contains(event.searchValue!.toLowerCase())).toList();
        yield state.copyWith(countryList: tempList);
      }else{
        yield state.copyWith(countryList: state.countrySearchList);
      }
    }
    else if(event is FetchSingleCountry){
      String query =  graphqlQuery.countryWithCode(event.countryCode!);
      var res =  await services.postGraphqlQuery(url: API.COUNTRY_LIST, query: query);
      if(res !=  "error"){
        // get Data
      }else{
        Fluttertoast.showToast(
            msg: Constant.someThingWentWrong,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0
        );
      }
    }

  }
}