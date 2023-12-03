import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/service/networkingservcie.dart';

import '../models/question_model.dart';

class QuizController extends GetxController{

  final String url;
  final String res;
  QuizController(this.url,this.res);

  RxList<Question> quiz = <Question>[].obs;
  RxInt int = 0.obs;
  RxString selectedOption = ''.obs;
  RxString endpoint = ''.obs;

  @override
  void onInit() async {
    quiz.value = await fetchAllQuestions(url);
    endpoint.value = res;

    super.onInit();
  }

  increment_int(){
    int.value+=1;
  }
  decrement_int(){
    int.value-=1;
  }

  selectOption(String option){
    selectedOption.value = option;
  }

}