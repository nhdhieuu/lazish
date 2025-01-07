import 'package:flutter/material.dart';

class SpeakingPage extends StatefulWidget {
  const SpeakingPage({super.key});

  @override
  State<SpeakingPage> createState() => _SpeakingPageState();
}

class _SpeakingPageState extends State<SpeakingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Nói lại câu sau',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/lazish.png',
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: 86,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF9F9F9),
                          // Background color
                          border: Border.all(color: Colors.black),
                          // Border color
                          borderRadius: BorderRadius.circular(
                              8), // Optional: rounded corners
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.volume_up,
                              color: Color(0xFFF583FC9),
                              size: 30,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              // Đảm bảo Text không bị overflow
                              child: Text(
                                'The call is from your mother',
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                                softWrap: true, // Cho phép xuống dòng
                                overflow: TextOverflow.visible, // Không cắt bớt
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 86,
                        decoration: BoxDecoration(
                          // Background color
                          border: Border.all(color: Colors.black),
                          // Border color
                          borderRadius: BorderRadius.circular(
                              8), // Optional: rounded corners
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.mic,
                              color: Color(0xFFF866CFE),
                              size: 30,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              // Đảm bảo Text không bị overflow
                              child: Text(
                                'Tap to talks',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF866CFE),
                                ),
                                softWrap: true, // Cho phép xuống dòng
                                overflow: TextOverflow.visible, // Không cắt bớt
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
