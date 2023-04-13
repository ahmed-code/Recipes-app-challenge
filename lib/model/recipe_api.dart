import 'dart:convert';

import 'package:http/http.dart' as http;

class RecipeApi {
  Future<List> getRecipes() async {
    Uri url = Uri.https(
      "tasty.p.rapidapi.com",
      "/recipes/list",
      {"from": '0', "size": '13', "tags": 'under_30_minutes'},
    );

    var response = await http.get(
      url,
      headers: {
        'X-RapidAPI-Key': 'b3f56fee19mshd8b144358aa053dp18c15bjsnefed0da7e4d7',
        'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
      },
    );

    if (response.statusCode == 200) {
      Map results = json.decode(response.body);
      return results["results"];
    }
    return ["error"];
  }
}
