import 'dart:convert';

import 'package:compound/models/employee_model.dart';
import 'package:http/http.dart';

class ApiServices{
  static Future<List<EmployeeModel>> getPosts(int page) async {
    Response res = await get(Uri.parse('https://api.github.com/users?per_page=15&since=$page'));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<EmployeeModel> posts = body
          .map(
            (dynamic item) => EmployeeModel.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}