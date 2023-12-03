import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/question_model.dart';


// /question/allQuestions
String baseUrl="https://c7bd-150-107-182-73.ngrok-free.app/" ;
//
// class Networking {
//
//
// }
Future<List<Question>> fetchAllQuestions(url) async {
  try {
    print("he");
    final response = await http.get(Uri.parse(baseUrl+url));
    // Handle the response
    if (response.statusCode == 200) {
      print(response.body);
      return questionFromJson(response.body);
    } else {
      print('Error: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    // Handle error
    print("===================");
    print('Error: $e');
    return [] ;
  }
}


Future<int> calculate(List<Map<String, dynamic>> answers,String url) async {
  print(url+"  csn gn n,g ;km");
  print(answers);
  final response = await http.post(
      // url= ='quiz/submit/1'
    Uri.parse(baseUrl+url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(answers),
    // body: answers,
  );
  print(response.statusCode);

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, handle the response.
    print(answers[0].keys);
    print("calculating =========");
    print(response.body);
    print("calculated =========");
    return int.parse(response.body);
    print('Data sent successfully');
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    return 0 ;
  }
}
