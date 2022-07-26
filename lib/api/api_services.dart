import 'dart:convert';
import 'dart:developer';

import 'package:sample_api/api/api_constants.dart';
import 'package:sample_api/models/questions_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<QuestionsModel>> getQuestions() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var respones = await http.get(url);
      log('getQuestions == ' + respones.body);
      if (respones.statusCode == 200) {
        final Map _body = jsonDecode(respones.body);
        final List _results = _body['results'];

        final List<QuestionsModel> _questions = _results
            .map((json) => questionsModelFromJson(jsonEncode(json)))
            .toList();
        return _questions;
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
