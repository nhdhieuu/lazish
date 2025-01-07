import 'dart:math';
import 'package:flutter/material.dart';

class WordMatching extends StatefulWidget {
  final VoidCallback onContinue;
  const WordMatching({super.key, required this.onContinue});

  @override
  _WordMatchingState createState() => _WordMatchingState();
}

class _WordMatchingState extends State<WordMatching> {
  final List<Map<String, String>> wordPairs = [
    {"Thành viên": "Member"},
    {"Phụ nữ": "Woman"},
    {"Cái Đĩa": "Plate"},
    {"Đúng": "Yes"},
    {"Không": "No"},
    {"Cái thìa": "Spoon"},
  ];
  bool allMatched() {
    return matchedPairs.length == wordPairs.length * 2;
  }
  late List<String> vietnameseWords;
  late List<String> englishWords;
  String? selectedVietnamese;
  String? selectedEnglish;
  Set<String> matchedPairs = {};
  bool isChecking = false;

  @override
  void initState() {
    super.initState();
    _shuffleWords();
  }

  void _shuffleWords() {
    final random = Random();
    vietnameseWords = wordPairs.map((pair) => pair.keys.first).toList()
      ..shuffle(random);
    englishWords = wordPairs.map((pair) => pair.values.first).toList()
      ..shuffle(random);
  }

  void checkMatch() {
    if (selectedVietnamese != null && selectedEnglish != null) {
      bool isCorrect = wordPairs.any((pair) =>
      pair.keys.first == selectedVietnamese &&
          pair.values.first == selectedEnglish);

      setState(() {
        isChecking = true;
        if (isCorrect) {
          matchedPairs.add(selectedVietnamese!);
          matchedPairs.add(selectedEnglish!);
        }
      });

      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          if (!isCorrect) {
            selectedVietnamese = null;
            selectedEnglish = null;
          }
          isChecking = false;
        });
      });
    }
  }

  Color getButtonColor(String word, bool isVietnamese) {
    if (matchedPairs.contains(word)) {
      return Color(0xFF6949FF);
    }
    if (isChecking) {
      if ((isVietnamese && word == selectedVietnamese) ||
          (!isVietnamese && word == selectedEnglish)) {
        bool isCorrect = wordPairs.any((pair) =>
            pair.keys.first == selectedVietnamese &&
            pair.values.first == selectedEnglish);
        return isCorrect ? Color(0xFF6949FF) : Colors.red;
      }
    }
    if ((isVietnamese && word == selectedVietnamese) ||
        (!isVietnamese && word == selectedEnglish)) {
      return Colors.blue.withOpacity(0.3);
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 33),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chạm để ghép nghĩa của từ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100),

              // Word columns
              Expanded(
                child: Row(
                  children: [
                    // Vietnamese words
                    Expanded(
                      child: Column(
                        children: vietnameseWords.map((word) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: SizedBox(
                              width: 189,
                              child: OutlinedButton(
                                onPressed: matchedPairs.contains(word)
                                    ? null
                                    : () {
                                        setState(() {
                                          selectedVietnamese = word;
                                        });
                                      },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: getButtonColor(word, true),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  side: BorderSide(
                                    color: matchedPairs.contains(word)
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    word,
                                    style: TextStyle(
                                      color: matchedPairs.contains(word)
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 16),
                    // English words
                    Expanded(
                      child: Column(
                        children: englishWords.map((word) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: SizedBox(
                              width: 189,
                              child: OutlinedButton(
                                onPressed: matchedPairs.contains(word)
                                    ? null
                                    : () {
                                        setState(() {
                                          selectedEnglish = word;
                                        });
                                      },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: getButtonColor(word, false),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  side: BorderSide(
                                    color: matchedPairs.contains(word)
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    word,
                                    style: TextStyle(
                                      color: matchedPairs.contains(word)
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),

              // Check answer button
              ElevatedButton(
                onPressed: allMatched()
                    ? widget.onContinue
                    : (selectedVietnamese != null && selectedEnglish != null)
                    ? checkMatch
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6949FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  allMatched() ? "Hoàn thành" : "Kiểm tra đáp án",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
