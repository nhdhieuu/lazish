import 'package:flutter/material.dart';
import 'package:lazish/pages/successfull_page.dart';
import 'package:lazish/widgets/input_step_page.dart';
import 'package:lazish/widgets/step_progress.dart';

class StepProgressPage extends StatefulWidget {
  const StepProgressPage({super.key});

  @override
  State<StepProgressPage> createState() => _StepProgressPageState();
}

class _StepProgressPageState extends State<StepProgressPage> {
  final PageController _controller = PageController(initialPage: 0);

  final List<TextEditingController> _controllers = List.generate(
    4, // Số lượng trang
    (index) => TextEditingController(),
  );
  final List<GlobalKey<FormState>> _formKeys = List.generate(
    4,
    (index) => GlobalKey<FormState>(),
  );
  double _currentPage = 0;

  void _handleNext() {
    final currentForm = _formKeys[_currentPage.toInt()].currentState;

    if (currentForm != null && !currentForm.validate()) {
      // Nếu form không hợp lệ, dừng chuyển bước
      return;
    }

    if (_currentPage == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessfullPage(),
        ),
      );
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.ease,
      );
      setState(() {
        _currentPage++;
      });
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
    for (var controller in _controllers) {
      controller.dispose();
    }
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
                        child:
                            StepProgress(currentStep: _currentPage, steps: 4),
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
                  Form(
                    key: _formKeys[0],
                    child: InputStepPage(
                      title: "Tên bạn là gì?",
                      labelText: "Họ và tên",
                      hintText: "Nhập tên của bạn",
                      isPassword: false,
                      controller: _controllers[0],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Họ và tên không được để trống';
                        }
                        return null;
                      },
                    ),
                  ),
                  Form(
                    key: _formKeys[1],
                    child: InputStepPage(
                      title: "Bạn bao nhiêu tuổi?",
                      labelText: "Tuổi",
                      hintText: "Nhập tuổi của bạn",
                      isPassword: false,
                      controller: _controllers[1],
                      validator: (value) {
                        final age = int.tryParse(value ?? '');
                        if (value == null || value.isEmpty) {
                          return 'Tuổi không được để trống';
                        }
                        if (age == null || age <= 0) {
                          return 'Tuổi phải là số hợp lệ';
                        }
                        return null;
                      },
                    ),
                  ),
                  Form(
                    key: _formKeys[2],
                    child: InputStepPage(
                      title: "Địa chỉ email của bạn là gì?",
                      labelText: "Email",
                      hintText: "Nhập email của bạn",
                      isPassword: false,
                      controller: _controllers[2],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email không được để trống';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Email không hợp lệ';
                        }
                        return null;
                      },
                    ),
                  ),
                  Form(
                    key: _formKeys[3],
                    child: InputStepPage(
                      title: "Tạo mật khẩu?",
                      labelText: "Mật khẩu",
                      hintText: "Nhập mật khẩu của bạn",
                      isPassword: true,
                      controller: _controllers[3],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mật khẩu không được để trống';
                        }
                        if (value.length < 6) {
                          return 'Mật khẩu phải dài ít nhất 6 ký tự';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                onPressed: _handleNext,
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
