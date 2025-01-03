import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String labelText; // Thêm label text
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText, // Label text là tùy chọn
    required this.prefixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  late TextEditingController _controller;
  Color _enabledBorderColor = Colors.grey[300]!;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_updateBorderColor);
  }

  void _updateBorderColor() {
    setState(() {
      _enabledBorderColor =
          _controller.text.isNotEmpty ? const Color(0xff6949ff) : Colors.grey[300]!;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_updateBorderColor);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Căn trái label và input
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            fontSize: 14, // Kích thước chữ của label
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8), // Khoảng cách giữa label và TextFormField
        TextFormField(
          controller: _controller,
          obscureText: widget.isPassword ? _obscureText : false,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: Icon(widget.prefixIcon, color: Colors.black),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            hintStyle: const TextStyle(color: Colors.grey),
           enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _enabledBorderColor),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff6949ff)),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}