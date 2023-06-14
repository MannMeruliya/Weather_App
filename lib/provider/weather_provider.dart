import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skyscrapper/model/weathermodel.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends ChangeNotifier{
  bool isLoading = false;
  List<Forecast> foreList = [];
  late Model model;
  late String place;
  List days = [];
  bool isSearch= false;
  String city = "surat";

  gotoSearch(){
    isSearch = !isSearch;
    notifyListeners();
  }

  getData() async {
    isLoading = true;
    String baseURL = "https://yahoo-weather5.p.rapidapi.com/weather";
    String location = city;

    Uri url = Uri.parse("$baseURL?location=$location");
    var response = await http.get(
      url,
      headers: {
        'X-RapidAPI-Key': '139d3957eamsh708f548a13e4809p15793bjsn381242a35547',
        'X-RapidAPI-Host': 'yahoo-weather5.p.rapidapi.com',
      },
    );
    print("Status code :: ${response.statusCode}");
    if(response.statusCode == 200) {
      model = Model.fromJson(json.decode(response.body));
   foreList.addAll(model.forecasts!);
   isLoading = false;
    }else{
      Fluttertoast.showToast(
          msg: "somthing is wrong..",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM
      );
      isLoading = false;
    }
  }
}