import 'dart:convert';
import 'package:adv_random_pepole_app/models/randomuserModels.dart';
import 'package:http/http.dart' as http;

int dataCount = 20;

class APIHelper {
  APIHelper._();
  static final APIHelper apiHelper = APIHelper._();

  String baseURL = "https://randomuser.me/";
  String endPoint = "api/";
  String resultsQuery = "?results=";

  Future<List<RandomUser>?> getUsersData() async {
    Uri api =
        Uri.parse(baseURL + endPoint + resultsQuery + dataCount.toString());

    http.Response response = await http.get(api);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = await jsonDecode(response.body);

      List<dynamic> allUserData = data['results'];

      return allUserData.map((e) => RandomUser.fromJson(e)).toList();
    }
    return null;
  }
}
