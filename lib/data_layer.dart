import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meme_api/meme_model.dart';

class MemeDataLayer {
  static Future<List<MemeModel>?> fetchMemes() async {
    try {
      final http.Response apiResponse =
          await http.get(Uri.parse("https://api.imgflip.com/get_memes"));
      if (apiResponse.statusCode == 200) {
        print("BODY RESPONSE ${apiResponse.body}");
        final responseBody = jsonDecode(apiResponse.body);
        final List data = responseBody['data']['memes'];
        print("DATA $data");
        return data.map((meme) => MemeModel.fromJson(meme)).toList();
      }
      return null;
    } catch (e) {
      print("EXCEPTION $e");
      return null;
    }
  }
}
