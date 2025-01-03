import 'package:flutter/material.dart';
import 'package:lazish/widgets/topic_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff6949ff),
        elevation: 0,
        titleTextStyle: TextStyle(fontSize: 16),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Quốc kỳ và EN
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/usa_flag.png', // Đường dẫn đến hình quốc kỳ
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  'EN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Ngọn lửa và số
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
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Hình lục giác và số
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
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Ngôi sao
            const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 24,
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
            progress: 15,
            total: 15,
            onPressed: () {},
            color: const Color(0xffA1D7FF),
          ),
          TopicCard(
            title: 'Thành phố',
            buttonText: 'Next',
            imagePath: 'assets/city.png',
            progress: 9,
            total: 15,
            onPressed: () {},
            color: const Color.fromARGB(255, 68, 236, 53),
          ),
          TopicCard(
            title: 'Chữ cái',
            buttonText: 'Next',
            imagePath: 'assets/abc.png',
            progress: 9,
            total: 15,
            onPressed: () {},
            color: const Color(0xffFFDA35),
    
          ),
          TopicCard(
            title: 'Thiên nhiên',
            buttonText: 'Start',
            imagePath: 'assets/nature.png',
            progress: 0,
            total: 15,
            onPressed: () {},
            color: const Color(0xffFF8D8D),
          ),
        ],
      ),
    );
  }
}
