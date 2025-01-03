import 'package:flutter/material.dart';
import 'package:lazish/pages/sign_in_page.dart';
import 'package:lazish/widgets/input_step_page.dart';
import 'package:lazish/widgets/step_progress.dart';

class StepProgressPage extends StatefulWidget {
  const StepProgressPage({super.key});

  @override
  State<StepProgressPage> createState() => _StepProgressPageState();
}

class _StepProgressPageState extends State<StepProgressPage> {
  final PageController _controller = PageController(initialPage: 0);
  double _currentPage = 0;

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
                        child: StepProgress(currentStep: _currentPage, steps: 4),
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
                  InputStepPage(
                    title: "Tên bạn là gì?",
                    labelText: "Họ và tên",
                    hintText: "Nhập tên của bạn",
                    isPassword: false,
                  ),
                  InputStepPage(
                    title: "Bạn bao nhiêu tuổi?",
                    labelText: "Tuổi",
                    hintText: "Nhập tuổi của bạn",
                    isPassword: false,
                  ),
                  InputStepPage(
                    title: "Địa chỉ email của bạn là gì?",
                    labelText: "Email",
                    hintText: "Nhập email của bạn",
                    isPassword: false,
                  ),
                  InputStepPage(
                    title: "Tạo mật khẩu?",
                    labelText: "Mật khẩu",
                    hintText: "Nhập mật khẩu của bạn",
                    isPassword: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage == 3) {
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInPage(),
                                ),
                        );
                  } else {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6949ff),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'TIẾP TỤC',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
