import 'package:flutter/material.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/constants/edge_insets.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.height = 44,
    this.prefixIcon,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final double height;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0x1A000000), width: 2),
    );

    return SizedBox(
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          suffixIcon: _buildSuffixIcon(),
          hintStyle: const TextStyle(color: Color(0x66000000)),
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          contentPadding: EdgeInsetsConstants.horizontal16,
          border: borderStyle,
          enabledBorder: borderStyle,
          focusedBorder: borderStyle.copyWith(
            borderSide: const BorderSide(
              color: ColorConstants.verifiedBlue,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.obscureText) {
      return IconButton(
        onPressed: () => setState(() => _obscureText = !_obscureText),
        icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
      );
    }
    return widget.suffixIcon != null ? Icon(widget.suffixIcon) : null;
  }
}
