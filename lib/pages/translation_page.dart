import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> with TickerProviderStateMixin {
  final List<String> selectedWords = [];
  final List<String> availableWords = [
    'Tôi',
    'bơi',
    'ăn cơm',
    'chạy nhanh',
    'cô ấy',
    'và',
    'Bạn',
    'đi bộ',
    'anh ấy'
  ];

  // Map to track animation controllers for each word
  final Map<String, AnimationController> _controllers = {};

  @override
  void initState() {
    super.initState();
    // Initialize controllers for each word
    for (var word in availableWords) {
      _controllers[word] = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      );
    }
  }

  @override
  void dispose() {
    // Dispose all controllers
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  final FlutterTts flutterTts = FlutterTts();

  Future<void> _speak(String text) async {
    try {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
    } catch (e) {
      print("Error: $e");
    }
  }

  void _animateAndMove(String word, bool toSelected) {
    if (toSelected) {
      // Start jump animation
      _controllers[word]?.forward().then((_) {
        setState(() {
          availableWords.remove(word);
          selectedWords.add(word);
        });
        _controllers[word]?.reset();
      });
    } else {
      setState(() {
        selectedWords.remove(word);
        availableWords.add(word);
      });
    }
  }

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
                'Dịch nghĩa câu sau',
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
                    GestureDetector(
                      onTap: () => _speak("I walk and she swims."),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.volume_up,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'I walk and she swims.',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: selectedWords
                      .map((word) => GestureDetector(
                    onTap: () => _animateAndMove(word, false),
                    child: Chip(
                      label: Text(word),
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ))
                      .toList(),
                ),
              ),

              const Spacer(),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: availableWords
                    .map((word) => AnimatedBuilder(
                  animation: _controllers[word]!,
                  builder: (context, child) {
                    final value = Curves.easeOut
                        .transform(_controllers[word]!.value);
                    return Transform.translate(
                      offset: Offset(0, -50 * value),
                      child: GestureDetector(
                        onTap: () => _animateAndMove(word, true),
                        child: Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          label: Text(word),
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    );
                  },
                ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}