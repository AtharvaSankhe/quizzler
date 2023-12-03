import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:quizapp/bottom_nav.dart';
import 'package:quizapp/views/quiz_result.dart';

import '../controller/quiz_controller.dart';
import '../service/networkingservcie.dart';

class QuizQuestion extends StatefulWidget {
  QuizQuestion({
    Key? key,
  }) : super(key: key);

  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  @override
  void initState() {
    print("hello");
    super.initState();
  }

  QuizController quizController = Get.find();
  bool tap = false;
  List<Map<String, dynamic>> answers = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, dynamic> arguments = Get.arguments;
    bool prac = arguments['prac'];

    return Scaffold(
      backgroundColor: Colors.black,
      bottomSheet: Container(
        height: 80,
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Get.offAll(() => BottomNav());
              },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_circle_left_outlined,
                    color: Colors.grey,
                    size: 25,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Quit Quiz",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 25),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                tap=false;
                if (quizController.int.value ==
                    quizController.quiz.length - 1) {
                  if(prac){
                    Get.back();
                  }else{
                    answers.add({
                      'id': quizController.int.value,
                      'response':
                      "${quizController.selectedOption.value}",
                    });
                    print("heloo............" +
                        answers[0].keys.first);
                    int res = await calculate(
                        answers, quizController.endpoint.value);
                    Get.offAll(() => Result(res: res));
                  }

                } else {
                  answers.add({
                    'id': quizController.int.value,
                    'response':
                    "${quizController.selectedOption.value}",
                  });
                  quizController.increment_int();
                  quizController.selectOption('');
                }
              },
              child: Container(
                width: size.width * 0.42,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                    quizController.int.value ==
                        quizController.quiz.length - 1
                        ? prac?"End":"Submit"
                        : "Next",
                    style: TextStyle(
                        color: Colors.white, fontSize: 25)),
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => SafeArea(
          child: quizController.quiz.isEmpty
              ? Center(
                  child: SpinKitThreeBounce(
                    color: Colors.white,
                  ),
                )
              : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
                child: Container(
                    height: size.height,
                    width: size.width,
                    padding: EdgeInsets.all(18),
                    child: Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Quiz",
                            style: TextStyle(color: Colors.grey, fontSize: 25),
                          ),
                          Row(
                            children: [
                              Text(
                                "Question ${quizController.int.value + 1}",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 30),
                              ),
                              Text(
                                "/${quizController.quiz.length}",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 22),
                              ),
                              if (prac && quizController.int.value != 0)
                                IconButton(
                                  onPressed: () {
                                    quizController.decrement_int();
                                    tap = false;
                                  },
                                  icon: Icon(Icons.arrow_back_ios),
                                  color: Colors.white,
                                )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Obx(() => Text(
                                quizController
                                    .quiz[quizController.int.value].questionTitle,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              )),
                          SizedBox(
                            height: 35,
                          ),
                          GestureDetector(
                            onTap: () {
                              quizController.selectOption(quizController
                                  .quiz[quizController.int.value].option1);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: quizController.selectedOption.value ==
                                            quizController
                                                .quiz[quizController.int.value]
                                                .option1
                                        ? Colors.cyan
                                        : Colors.white,
                                    width: 2),
                              ),
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: Text(
                                    quizController
                                        .quiz[quizController.int.value].option1,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )),
                                  quizController.selectedOption.value ==
                                          quizController
                                              .quiz[quizController.int.value]
                                              .option1
                                      ? Icon(
                                          Icons.circle,
                                          color: Colors.cyan,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.circle_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              quizController.selectedOption(quizController
                                  .quiz[quizController.int.value].option2);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: quizController.selectedOption.value ==
                                            quizController
                                                .quiz[quizController.int.value]
                                                .option2
                                        ? Colors.cyan
                                        : Colors.white,
                                    width: 2),
                              ),
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: Text(
                                    quizController
                                        .quiz[quizController.int.value].option2,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )),
                                  quizController.selectedOption.value ==
                                          quizController
                                              .quiz[quizController.int.value]
                                              .option2
                                      ? Icon(
                                          Icons.circle,
                                          color: Colors.cyan,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.circle_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              quizController.selectedOption(quizController
                                  .quiz[quizController.int.value].option3);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: quizController.selectedOption.value ==
                                            quizController
                                                .quiz[quizController.int.value]
                                                .option3
                                        ? Colors.cyan
                                        : Colors.white,
                                    width: 2),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    quizController
                                        .quiz[quizController.int.value].option3,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  quizController.selectedOption.value ==
                                          quizController
                                              .quiz[quizController.int.value]
                                              .option3
                                      ? Icon(
                                          Icons.circle,
                                          color: Colors.cyan,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.circle_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              quizController.selectedOption(quizController
                                  .quiz[quizController.int.value].option4);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: quizController.selectedOption.value ==
                                            quizController
                                                .quiz[quizController.int.value]
                                                .option4
                                        ? Colors.cyan
                                        : Colors.white,
                                    width: 2),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: Text(
                                    quizController
                                        .quiz[quizController.int.value].option4,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )),
                                  quizController.selectedOption.value ==
                                          quizController
                                              .quiz[quizController.int.value]
                                              .option4
                                      ? Icon(
                                          Icons.circle,
                                          color: Colors.cyan,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.circle_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          prac
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      tap = !tap;
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 18),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade900,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      tap
                                          ? quizController
                                              .quiz[quizController.int.value]
                                              .rightAnswer
                                          : "TAP HERE TO GET THE ANSWER",
                                      style: TextStyle(
                                          color: Colors.cyan, fontSize: 18),
                                    ),
                                  ),
                                )
                              : Container(),
                          // Expanded(child: Container()),

                        ],
                      ),
                    ),
                  ),
              ),
        ),
      ),
    );
  }
}
