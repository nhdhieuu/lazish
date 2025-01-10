import 'package:flutter/material.dart';
import 'package:lazish/pages/successfull_page.dart';
import 'package:lazish/widgets/custom_text_field.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool rememberMe = false;

  void _handleNext() {
    if (_formKey.currentState!.validate()) {
      // Nếu form hợp lệ, chuyển đến trang chính
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const SuccessfullPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Image.asset(
                            'assets/arrowleft.png',
                            height: 40,
                            width: 40,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 42),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tạo mật khẩu mới 🔒",
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: const Text(
                        "Hãy nhớ mật khẩu của bạn. Nếu quên bạn có thể tiếp tục vào phần quên mật khẩu.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          CustomTextField(
                            labelText: "Mật khẩu mới",
                            hintText: 'Nhập mật khẩu của bạn',
                            prefixIcon: Icons.lock,
                            isPassword: true,
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng nhập mật khẩu";
                              }
                              if (value.length < 6) {
                                return "Mật khẩu phải có ít nhất 6 ký tự";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 18),
                          CustomTextField(
                            labelText: "Xác nhận mật khẩu",
                            hintText: "Nhập lại mật khẩu",
                            prefixIcon: Icons.lock,
                            isPassword: true,
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng xác nhận mật khẩu";
                              }
                              if (value != passwordController.text) {
                                return "Mật khẩu không khớp";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 18),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                activeColor: const Color(0xff6949ff),
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value!;
                                  });
                                },
                              ),
                              const Text(
                                "Nhớ mật khẩu",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                padding: const EdgeInsets.symmetric(vertical: 16),
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
        ]),
      ),
    );
  }
}
