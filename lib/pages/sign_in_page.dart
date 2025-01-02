import 'package:flutter/material.dart';
import 'package:lazish/widgets/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
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
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hello there 👋",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: "Email",
                      hintText: "Nhập email của bạn",
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      labelText: "Mật khẩu",
                      hintText: 'Nhập mật khẩu của bạn',
                      prefixIcon: Icons.lock,
                      isPassword: true,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
              // Dòng checkbox và TextButton
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
                    TextButton(
                      onPressed: () {
                        // Xử lý quên mật khẩu
                      },
                      child: const Text(
                        "Quên mật khẩu?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff6949ff),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Xử lý đăng nhập
                  },
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
                      'ĐĂNG NHẬP',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
