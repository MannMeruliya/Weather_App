import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skyscrapper/model/weathermodel.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Forecast> foreList = [];
  late Model model;
  late String place;
  List days = [];
  bool isSearch = false;
  String city = "surat";

  gotoSearch() {
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
        'X-RapidAPI-Key': '02d27ffd96mshb2ae6a4b1ab633dp15963fjsn947368dd0b1d',
        'X-RapidAPI-Host': 'yahoo-weather5.p.rapidapi.com',
      },
    );
    print("Status code :: ${response.statusCode}");
    print("Status code :: ${response.body}");
    if (response.statusCode == 200) {
      model = Model.fromJson(json.decode(response.body));
      foreList.addAll(model.forecasts!);
      isLoading = false;
      notifyListeners();
      print(url);
    } else {
      Fluttertoast.showToast(
          msg: "somthing is wrong..",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      isLoading = false;
    }
    isLoading = false;
  }
}
