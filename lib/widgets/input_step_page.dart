import 'package:flutter/material.dart';
import 'package:lazish/widgets/custom_text_field2.dart';

class InputStepPage extends StatelessWidget {
  final String title; // Tiêu đề
  final String labelText; // Nhãn
  final String hintText; // Gợi ý
  final bool isPassword; // Trạng thái mật khẩu

  const InputStepPage({
    super.key,
    required this.title,
    required this.labelText,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false, // Ngăn layout thay đổi khi bàn phím xuất hiện
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    const SizedBox(height: 42),
                    CustomTextField2(
                      labelText: labelText,
                      hintText: hintText,
                      isPassword: isPassword,
                      keyboardType: isPassword
                          ? TextInputType.visiblePassword
                          : TextInputType.text,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
