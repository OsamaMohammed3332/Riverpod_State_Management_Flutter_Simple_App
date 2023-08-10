import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_state_management/models/post_model.dart';

final getDataFuture =
    ChangeNotifierProvider<GetDataFromApi>((ref) => GetDataFromApi());

class GetDataFromApi extends ChangeNotifier {
  GetDataFromApi() {
    getData();
  }

  List<PostModel> listDataModel = [];

  Future getData() async {
    listDataModel = [];
    try {
      http.Response response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      var data = jsonDecode(response.body);
      for (var i = 0; i < data.length; i++) {
        listDataModel.add(PostModel.fromJson(data[i]));
      }
      print(data.length);
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
