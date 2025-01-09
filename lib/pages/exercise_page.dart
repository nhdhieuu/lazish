import 'package:flutter/material.dart';
import 'package:lazish/pages/completed_page.dart';
import 'package:lazish/pages/sign_in_page.dart';
import 'package:lazish/pages/speaking_page.dart';
import 'package:lazish/pages/streak_page.dart';
import 'package:lazish/pages/successfull_page.dart';
import 'package:lazish/pages/translation_page.dart';
import 'package:lazish/pages/word_matching.dart';
import 'package:lazish/widgets/input_step_page.dart';
import 'package:lazish/widgets/step_progress.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final PageController _controller = PageController(initialPage: 0);
  double _currentPage = 0;
  void nextPage() {
    if (_currentPage == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CompletedPage(),
        ),
      );
    } else {
      _controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Image.asset(
                        'assets/arrowleft.png',
                        height: 40,
                        width: 40,
                      ),
                      onPressed: () {
                        if (_currentPage == 0) {
                          Navigator.pop(context);
                        } else {
                          _controller.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        }
                      },
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 4),
                        child: StepProgress(currentStep: _currentPage, steps: 3),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, top: 8),
                      child: Text(
                        "987",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                  TranslationScreen(onContinue: nextPage),
                  SpeakingPage(onContinue: nextPage),
                  WordMatching(onContinue: nextPage),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
