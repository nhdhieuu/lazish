import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/material.dart';
import 'package:lazish/pages/forgot_password_page.dart';
import 'package:lazish/pages/main_layout_page.dart';
import 'package:lazish/widgets/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      // Nếu form hợp lệ, chuyển đến trang chính
      ElegantNotification.success(
        title: Text(
          "Đăng nhập thành công",
          style: const TextStyle(
            color: Color(0xFF494949),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        description: Text("Chào mừng bạn đến với Lazish!"),
        onDismiss: () {
          print('Message when the notification is dismissed');
        },
      ).show(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainLayoutPage(),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainLayoutPage(),
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
                          "Xin chào 👋",
                          style: const TextStyle(
                            fontSize: 32,
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
                          const SizedBox(height: 18),
                          CustomTextField(
                            labelText: "Mật khẩu",
                            hintText: 'Nhập mật khẩu của bạn',
                            prefixIcon: Icons.lock,
                            isPassword: true,
                            controller: passwordController,
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
                    const SizedBox(height: 18),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color.fromRGBO(
                                243, 242, 242, 1), // Màu của đường viền
                            width: 0.5, // Độ dày của đường viền
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Quên mật khẩu?",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff6949ff),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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
              onPressed: _handleSignIn,
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
        ]),
      ),
    );
  }
}
