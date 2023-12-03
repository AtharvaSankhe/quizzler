import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:quizapp/views/home.dart';
import 'package:quizapp/views/practice.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedindex = 0 ;

  void _navigation(int index){
    setState(() {
      _selectedindex = index ;
    });
  }

  final List<Widget> _pages = [
    const Home(),
    Practice(),
    // const Likes(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedindex),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(8),
        child: GNav(
          gap: 7,
          padding: const EdgeInsets.all(15),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.cyanAccent,
          // tabActiveBorder: Border.all(color: Colors.white),
          // tabBorder: Border.all(color: Colors.black),
          tabBackgroundColor: Colors.grey.shade800,
          tabBorderRadius: 25,
          selectedIndex: _selectedindex,
          onTabChange: _navigation,
          tabs:const [
            GButton(icon: Icons.home,text: 'Home',),
            GButton(icon: Icons.question_answer_outlined,text: 'Practice',),
          ],
        ),
      ),
    );
  }
}