import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/quiz_controller.dart';
import 'package:quizapp/main.dart';
import 'package:quizapp/quiz_starters/quiz_start.dart';
import 'package:quizapp/views/all_quiz.dart';
import 'package:quizapp/views/practice.dart';
import 'package:quizapp/views/quiz_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("QUIZZLER",style: TextStyle(color: Colors.cyanAccent,fontSize: 25,fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,

      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Get.to(()=>Quizzes());
                // Get.to(()=>QuizQuestion(),binding: BindingsBuilder(() {Get.put(QuizController('question/allQuestions','quiz/submit/1'));}));
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("assets/quiz.png",),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Test your",style: TextStyle(color: Colors.grey,fontSize: 18),),
                    Text("Knowledge on",style: TextStyle(color: Colors.grey,fontSize: 18),),
                    Text("QUIZZLER",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                      child: Text("START NOW",style: TextStyle(color: Colors.cyan,fontSize: 18),),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(()=>Practice());
              },
              child: Container(
                width: double.infinity,
                height: 75,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Practice test to gain knowledge  ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 18),),
                    Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("TOP QUIZZES !!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18),),
                GestureDetector(onTap: (){
                  Get.to(()=>Quizzes());
                },child: Text("VIEW ALL     ",style: TextStyle(color: Colors.cyanAccent,fontWeight: FontWeight.w700,fontSize: 12),)),

              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.to(()=>Start(),binding: BindingsBuilder(() {Get.put(QuizController('quiz/get/18','quiz/submit/18'));}));

                    // Get.to(()=>QuizQuestion(),binding: BindingsBuilder(() {Get.put(QuizController('quiz/get/18','quiz/submit/18'));}));
                  },
                  child: Container(
                    height: 200,
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/java.jpeg",),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>Start(),binding: BindingsBuilder(() {Get.put(QuizController('quiz/get/14','quiz/submit/14'));}));
                    // Get.to(()=>QuizQuestion(),binding: BindingsBuilder(() {Get.put(QuizController('quiz/get/14','quiz/submit/14'));}));
                  },
                  child: Container(
                    height: 200,
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/python.jpg",),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    // Get.to(()=>QuizQuestion(),binding: BindingsBuilder(() {Get.put(QuizController('quiz/get/6','quiz/submit/6'));}));
                    Get.to(()=>Start(),binding: BindingsBuilder(() {Get.put(QuizController('quiz/get/6','quiz/submit/6'));}));
                  },
                  child: Container(
                    height: 200,
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/sci.png",),
                        fit: BoxFit.cover,
                      ),
                    ),

                  ),
                ),
                GestureDetector(
                  onTap: (){
                    // Get.to(()=>QuizQuestion(),binding: BindingsBuilder(() {Get.put(QuizController('quiz/get/10','quiz/submit/10'));}));
                    Get.to(()=>Start(),binding: BindingsBuilder(() {Get.put(QuizController('quiz/get/10','quiz/submit/10'));}));

                  },
                  child: Container(
                    height: 200,
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/geo.jpg",),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      )
    );
  }
}
