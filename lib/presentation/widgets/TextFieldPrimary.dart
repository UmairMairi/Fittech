import 'package:fit_tech/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFieldPrimary extends StatefulWidget {
  final bool? isLabelRequired;
  final String? title;
  final bool? isObscure;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isEnabled;
  final String? hintText;

  const TextFieldPrimary({
    Key? key,
    required this.isLabelRequired,
    required this.title,
    required this.isObscure,
    required this.keyboardType,
    this.isEnabled,
    this.controller,
    this.validator,
    this.hintText,
  }) : super(key: key);

  @override
  _TextFieldPrimaryState createState() => _TextFieldPrimaryState();
}

class _TextFieldPrimaryState extends State<TextFieldPrimary> {
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = widget.isObscure!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.isLabelRequired!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                Text(
                  widget.title!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontFamily: 'Open Sance',
                      fontSize: 14, color: MyColors.greyColor),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        TextFormField(
          textAlign: TextAlign.start,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          validator: widget.validator,
          enabled: widget.isEnabled,
          decoration: InputDecoration(
              hintText: widget.hintText ?? "",
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              fillColor: MyColors.whiteColor,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: MyColors.greyColor),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              suffixIcon: widget.isObscure!
                  ? IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
                  : null),
          style: const TextStyle(color: MyColors.blackColor),
          obscureText: widget.isObscure! ? _isPasswordVisible : false,
        )
      ],
    );
  }
}
