import 'package:flutter/material.dart';

class CustomTextField2 extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;

  const CustomTextField2({
    super.key,
    required this.hintText,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.controller,
    this.validator,
  });

  @override
  _CustomTextFieldState2 createState() => _CustomTextFieldState2();
}

class _CustomTextFieldState2 extends State<CustomTextField2> {
  late TextEditingController _controller;
  bool _obscureText = true;
  Color _enabledBorderColor = Colors.grey[300]!;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_updateBorderColor);
  }

  void _updateBorderColor() {
    setState(() {
      _enabledBorderColor = _controller.text.isNotEmpty
          ? const Color(0xff6949ff)
          : Colors.grey[300]!;
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? _obscureText : false,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
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
