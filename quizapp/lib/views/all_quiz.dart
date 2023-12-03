import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/quiz_controller.dart';
import '../quiz_starters/quiz_start.dart';

class Quizzes extends StatelessWidget {
  Quizzes({Key? key}) : super(key: key);

  List tabs = ['SCIENCE','GEOGRAPHY','PYTHON','JAVA'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text(
              "QUIZZES", style: TextStyle(color: Colors.cyan, fontSize: 25),),
            centerTitle: true,
            backgroundColor: Colors.grey.shade900,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            bottom: TabBar(
              unselectedLabelColor: Colors.grey.shade700,
              indicatorColor: Colors.cyan,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.cyan,
              labelStyle: TextStyle(
                color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 14,
              ),
              indicatorWeight: 4,
              // unselectedLabelStyle: TextStyle(
              //   color: Colors.black,fontWeight: FontWeight.w400,fontSize: 12,
              // ),

              tabs: [
                Tab(text: 'SCIENCE'),
                Tab(text: 'GEO'),
                Tab(text: 'PYTHON'),
                Tab(text: 'JAVA'),

              ],
            ),
          ),
          body: TabBarView(
            children: [
              for(int i = 0; i < 4; i++)
                ListView.builder(itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    int val = 3+i*4+index;
                    return GestureDetector(
                      onTap: (){
                        Get.to(()=>Start(),binding: BindingsBuilder(() {Get.put(QuizController('quiz/get/${val}','quiz/submit/${val}'));}));
                      },
                      child: Container(
                        height: 70,
                        margin: EdgeInsets.only(left: 18,right: 18,top: 25),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(tabs[i]+" QUIZ${index+1}",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w100,letterSpacing: 2),),
                          ],
                        ),
                      ),
                    );
                  },)
            ],
          ),
        ));
  }
}
