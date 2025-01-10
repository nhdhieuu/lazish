import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:lazish/pages/welcome_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Chỉnh sửa thông tin",
          style: TextStyle(
            color: Color(0xFF494949),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child:  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/avatar.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildInputField(
                  label: "Họ và tên",
                  initialValue: "Phan Châu Hoàng",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Họ và tên không được để trống';
                    }
                    return null;
                  },
                ),
                _buildInputField(
                  label: "Số điện thoại",
                  initialValue: "+84090000987",
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Số điện thoại không được để trống';
                    }
                    if (!RegExp(r'^\+84\d{9,10}$').hasMatch(value)) {
                      return 'Số điện thoại không hợp lệ';
                    }
                    return null;
                  },
                ),
                _buildInputField(
                  label: "Email",
                  initialValue: "phanchauhoang@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email không được để trống';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Email không hợp lệ';
                    }
                    return null;
                  },
                ),
                _buildInputField(
                  label: "Ngày sinh",
                  initialValue: "13/06/2004",
                  readOnly: true,
                  suffix: const Icon(
                    Icons.calendar_month,
                    color: Color(0xFF6949FF),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Ngày sinh không được để trống';
                    }
                    return null;
                  },
                ),
                _buildInputField(
                  label: "Quốc tịch",
                  initialValue: "Việt Nam",
                  readOnly: true,
                  suffix: const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFF6949FF),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Quốc tịch không được để trống';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ElegantNotification.success(
                          title:  Text("Cập nhật thành công",
                            style: TextStyle(
                              color: Color(0xFF494949),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          description:  Text("Thông tin của bạn đã được cập nhật thành công! "),
                          onDismiss: () {
                            print('Message when the notification is dismissed');
                          },
                        ).show(context);
                        Navigator.pop(context);
                      }

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6949FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text(
                      "Lưu thay đổi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String initialValue,
    bool readOnly = false,
    TextInputType? keyboardType,
    Widget? suffix,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF494949),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          readOnly: readOnly,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: suffix,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6949FF)),
            ),
          ),
          validator: validator,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}