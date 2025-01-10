import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lazish/pages/learning_path_page.dart';
import 'package:lazish/pages/edit_profile_page.dart';
import 'package:lazish/pages/exercise_page.dart';
import 'package:lazish/pages/profile_page.dart';
import 'package:lazish/pages/streak_page.dart';
import 'package:lazish/widgets/topic_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showChallengeTrackerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const SingleChildScrollView(
          child:
              ChallengeContent(), // Sử dụng ChallengeContent như bạn định nghĩa
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff6949ff),
        elevation: 0,
        titleTextStyle: TextStyle(fontSize: 16),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(),
                  ),
                );
              },
              child: ClipOval(

                child: Image.asset(
                  'assets/avatar.png', // Đường dẫn đến hình quốc kỳ
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 8,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( 
                  "Hi, Hiếu",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/fire.png', // Đường dẫn đến hình biểu tượng
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  '4',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Hình lục giác và số
            const SizedBox(
              width: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/gem.png', // Đường dẫn đến hình biểu tượng
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  '957',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          TopicCard(
            title: 'Động vật',
            buttonText: 'View',
            imagePath: 'assets/animal.png',
            progress: 13,
            total: 15,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LearningPathPage(title: "Động vật", color: Color(0xffA1D7FF),),
                ),
              );
            },
            color: const Color(0xffA1D7FF),
          ),
          TopicCard(
            title: 'Thành phố',
            buttonText: 'Next',
            imagePath: 'assets/city.png',
            progress: 9,
            total: 15,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LearningPathPage(title: "Thành phố", color: Color.fromARGB(255, 68, 236, 53),),
                ),
              );
            },
            color: const Color.fromARGB(255, 68, 236, 53),
          ),
          TopicCard(
            title: 'Chữ cái',
            buttonText: 'Next',
            imagePath: 'assets/abc.png',
            progress: 9,
            total: 15,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LearningPathPage(title: "Chữ cái", color: Color(0xffFFDA35),),
                ),
              );
            },
            color: const Color(0xffFFDA35),
          ),
          TopicCard(
            title: 'Thiên nhiên',
            buttonText: 'Start',
            imagePath: 'assets/nature.png',
            progress: 0,
            total: 15,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LearningPathPage(title: "Thiên nhiên", color: Color(0xffFF8D8D),),
                ),
              );
            },
            color: const Color(0xffFF8D8D),
          ),
        ],
      ),
    );
  }
}
