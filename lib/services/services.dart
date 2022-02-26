import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class Services {


//---------------fetching an graphqlquery--------------//
  Future<dynamic> postGraphqlQuery({String? url, String? query}) async {

    Map body = {"query": query};
    Map<String, String> headers = {"Content-Type": "application/json",'Accept': 'application/json'};
    try{
      var uri =Uri.parse(url!);
      var response = await post(
          uri,
          body: jsonEncode(body),
          headers: headers);
      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }
      else{
        return "error";
      }
    }catch(error){
      Fluttertoast.showToast(
          msg: error.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0
      );
      return "error";
    }
  }

}