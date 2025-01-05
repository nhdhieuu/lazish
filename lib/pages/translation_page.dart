import 'package:flutter/material.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
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
              // Header
              const SizedBox(height: 24),

              // Title
              const Text(
                'Dịch nghĩa câu sau',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              // English sentence with speaker icon
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
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
                    const SizedBox(width: 16),
                    const Text(
                      'I walk and she swims.',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Selected words area
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
                            onTap: () {
                              setState(() {
                                selectedWords.remove(word);
                                availableWords.add(word);
                              });
                            },
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

              // Available words
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: availableWords
                    .map((word) => GestureDetector(
                          onTap: () {
                            setState(() {
                              availableWords.remove(word);
                              selectedWords.add(word);
                            });
                          },
                          child: Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21),
                            ),
                            label: Text(word),
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
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
