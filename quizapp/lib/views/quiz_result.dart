import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/bottom_nav.dart';
import 'package:quizapp/controller/quiz_controller.dart';


class Result extends StatelessWidget {
  int res;

  Result({Key? key, required this.res}) : super(key: key);

  QuizController quizController = Get.find();

  List comment = ['Very Poor', 'Can do better', 'Great', 'Congratulations !!'];
  int val = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (res < 2) {
      val = 1;
    } else if (res < 5) {
      val = 2;
    } else if (res < 9) {
      val = 3;
    } else {
      val = 4;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Quiz Result",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset("assets/res${val}.png"),
              SizedBox(
                height: 10,
              ),
              Text(
                comment[val - 1],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Your Score",
                style: TextStyle(
                    color: Colors.grey, fontSize: 25, letterSpacing: 3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${res}",
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "/${quizController.quiz.length}",
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    // onTap: () async {
                    //   await Share.share(
                    //       'I Scored ${res}/${quizController.quiz.length} on Quizzler App. '
                    //           'Go download the app from playstor and try it for yourself');
                    // },
                    child: Container(
                      width: size.width * 0.4,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.grey.shade800,
                            size: 20,
                          ),
                          Text(
                            " Share Results",
                            style: TextStyle(
                                color: Colors.grey.shade800, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      quizController.int.value = 0;
                      Get.delete<QuizController>();
                      print("disposing");
                      Get.to(BottomNav());
                    },
                    child: Container(
                      width: size.width * 0.4,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            "  Home",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
