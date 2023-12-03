import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/views/quiz_page.dart';

import '../controller/quiz_controller.dart';

class Practice extends StatelessWidget {
  Practice({Key? key}) : super(key: key);

  List topics = [ 'JAVA','PYTHON','SCIENCE','GEOGRAPHY'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Practice",
          style: TextStyle(
              color: Colors.cyanAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: ListView.separated(
          itemCount: 4,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 15,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Get.to(()=>QuizQuestion(),arguments: {'prac':true},binding: BindingsBuilder(() {Get.put(QuizController('quiz/get/${23+index}','quiz/submit/${23+index}'));}));
              },
              child: Container(
                height: 110,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade900,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(topics[index],style: TextStyle(color: Colors.white,fontSize: 18),),
                    Text("  Practice Questions",style: TextStyle(color: Colors.grey,fontSize: 15),),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
