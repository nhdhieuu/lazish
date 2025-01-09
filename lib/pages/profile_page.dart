import 'package:flutter/material.dart';

import '../widgets/chart.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              "assets/update_profile.png",
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "assets/lazish.png",
              width: 123,
              height: 123,
            ),
            const SizedBox(height: 21),
            const Text(
              "Phan Châu Hoàng",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Từ 01/11/2024",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius:
                    BorderRadius.circular(10.0), // Add border radius here
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Phan Châu Hoàng",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF555555),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Image.asset("assets/gem.png", width: 20, height: 20),
                          const SizedBox(width: 7),
                          const Text(
                            "948",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF7A7A7B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  XPChart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
