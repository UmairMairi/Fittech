import 'package:fit_tech/utils/colors.dart';
import 'package:fit_tech/utils/my_styles.dart';
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
  final String? suffixText;
  final Widget? suffix;
  final int? lines;
  final Function(String)? onChanged;
  final bool showCounter;
  final int? maxLength;
  final TextAlign? textAlign;
  final bool hideBorder;

  const TextFieldPrimary(
      {Key? key,
      required this.isLabelRequired,
      required this.title,
      required this.isObscure,
      required this.keyboardType,
      this.isEnabled,
      this.controller,
      this.validator,
      this.hintText,
      this.suffix,
      this.lines,
      this.onChanged,
      this.suffixText,
      this.showCounter = false,
      this.maxLength,
      this.hideBorder = false,
      this.textAlign})
      : super(key: key);

  @override
  _TextFieldPrimaryState createState() => _TextFieldPrimaryState();
}

class _TextFieldPrimaryState extends State<TextFieldPrimary> {
  bool _isPasswordVisible = false;
  String _enteredText = '';

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
        // Visibility(
        //   visible: widget.isLabelRequired!,
        //   child: Column(
        //     children: [
        //       Text(
        //         widget.title!,
        //         textAlign: TextAlign.start,
        //         style: MyTextStyle.inputTitle.copyWith(color: MyColors.greyColor),
        //       ),
        //       const SizedBox(
        //         height: 5.0,
        //       ),
        //     ],
        //   ),
        // ),
        TextFormField(
          textAlign: widget.textAlign ?? TextAlign.start,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          validator: widget.validator,
          enabled: widget.isEnabled,
          maxLines: (widget.isObscure == null || widget.isObscure == false)
              ? widget.lines
              : 1,
          minLines: (widget.isObscure == null || widget.isObscure == false)
              ? widget.lines
              : null,
          decoration: InputDecoration(
              hintText: widget.hintText ?? "",
              hintStyle:
                  MyTextStyle.inputTitle.copyWith(color: MyColors.greyColor),
              labelText: widget.title!,
              labelStyle:
                  MyTextStyle.inputTitle.copyWith(color: MyColors.greyColor),
              errorStyle: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Open Sance',
                  color: MyColors.redColor),
              constraints: const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
              contentPadding: EdgeInsets.zero,
              fillColor: MyColors.whiteColor,
              border: (widget.hideBorder)
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyColors.greyColor),
                    ),
              focusedBorder: (widget.hideBorder)
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
              errorBorder: (widget.hideBorder)
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
              suffix: widget.suffix,
              suffixText: widget.suffixText,
              alignLabelWithHint: true,
              counterText: widget.showCounter
                  ? "${_enteredText.length}/${widget.maxLength}"
                  : null,
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
                      constraints:
                          const BoxConstraints(minWidth: 0.0, minHeight: 0.0),
                      padding: EdgeInsets.zero,
                    )
                  : null),
          style: MyTextStyle.paragraph1,
          obscureText: widget.isObscure! ? _isPasswordVisible : false,
          maxLength: widget.maxLength,
          onChanged: (val) {
            if (widget.onChanged != null) {
              widget.onChanged!(val);
            }
            if (widget.showCounter) {
              setState(() {
                _enteredText = val;
              });
            }
          },
        )
      ],
    );
  }
}
