import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/quiz_controller.dart';
import '../views/quiz_page.dart';

class Start extends StatelessWidget {
  Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomSheet: GestureDetector(
        onTap: (){
          Get.to(()=>QuizQuestion(),arguments: {'prac':false});
        },
        child: Container(
          height: 80,
          color: Colors.grey.shade800,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.not_started_outlined,size: 25,color: Colors.cyan,),
              Text("  START QUIZ",style: TextStyle(color: Colors.cyan,fontSize: 20,fontWeight: FontWeight.w600),),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(18),
            child: Column(
              children: [
                Text("RULES FOR QUIZ:",style: TextStyle(color: Colors.white,fontSize: 27,fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),
                Text(
                    "1] Once you press the Next button to move to the next question, you won't be able to go back to the previous question.",style: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.w400,fontSize: 20),textAlign: TextAlign.start,),
                const SizedBox(height: 15,),
                Text("2] This quiz comprises a total of 10 questions. You'll go through each question in sequential order until you reach the end of the quiz.",style: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.w400,fontSize: 20),textAlign: TextAlign.start,),
                const SizedBox(height: 15,),
                Text("3] Your score will be determined after you answer the 10th question. It's calculated based on the number of correct answers out of the total 10 questions.",style: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.w400,fontSize: 20),textAlign: TextAlign.start,),
                const SizedBox(height: 15,),
                Text("4] There's no time limit for answering each question. Take as much time as you need to consider and answer each question at your own pace.",style: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.w400,fontSize: 20),textAlign: TextAlign.start,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// "After answering the current question, click the 'Next' button to proceed to the next question.
// Please note that you won't be able to go back
// to previous questions once you move forward, so make sure to finalize your response before advancing.
