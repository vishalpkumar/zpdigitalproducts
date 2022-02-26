import 'package:ezcountries/bloc/country/country_bloc.dart';
import 'package:ezcountries/bloc/country/country_event.dart';
import 'package:ezcountries/bloc/country/country_state.dart';
import 'package:ezcountries/model/country_model.dart';
import 'package:ezcountries/untils/common.dart';
import 'package:ezcountries/untils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/src/provider.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

  final TextEditingController _searchController =  TextEditingController();


  @override
  Widget build(BuildContext context) {
    context.read<CountryBloc>().add(FetchCountryList());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country List"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(35.0),
          child: Container(
            padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 10.0),
            child: Common.searchBar(
                controller: _searchController,
                onChanged:(value){
                  context.read<CountryBloc>().add(SearchCountry(searchValue: value));
                },
                hint: Constant.search,
            ),
          ),
        ),
      ),
      body:BlocBuilder<CountryBloc, CountryState>(
          builder: (BuildContext context, CountryState state){
             return state.isLoading == false ?
             state.countryList!.isNotEmpty ? ListView.builder(
                 itemCount: state.countryList!.length,
                 itemBuilder: (context, index){
                  return _itemBuild(context, state, state.countryList![index]);
             }):const Center(
               child: Text(Constant.notFoundCountry,style: TextStyle(color: Colors.black),),
             ): const Center(
               child: Text(Constant.pleaseWait,style: TextStyle(color: Colors.black),),
             );
          },
      ),
    );
  }

  Widget _itemBuild(BuildContext context, CountryState state, CountryModel countryModel) {
    return InkWell(
      onTap: (){
        context.read<CountryBloc>().add(FetchSingleCountry(countryCode: countryModel.code));
        Fluttertoast.showToast(
            msg: "${countryModel.name} ${countryModel.code}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0
        );
      },
      child: Card(
          child: Padding(
            padding :const EdgeInsets.all(10.00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${Constant.countryCode} : ${countryModel.code}", style: const TextStyle(color: Colors.black),),
                const SizedBox(height: 1.0,),
                Text("${Constant.countryName} : ${countryModel.name}", style: const TextStyle(color: Colors.black),),
                Row(
                  children: [
                    const Text("${Constant.countryLanguages} : ", style: TextStyle(color: Colors.black),),
                    for(int i =0; i < countryModel.countryLanguages!.length; i++)
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.only(right: 13.0),
                          child: Text("${countryModel.countryLanguages![i].name}", style: const TextStyle(color: Colors.black),),
                        ),
                      ),
                  ],
                ),

              ],
            ),
          ),
      ),
    );
  }

}
