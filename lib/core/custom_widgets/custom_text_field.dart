import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/theme.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String subTitle;
  final String hintText;
  final String titleHintText;
  final String label;
  final bool isEmail;
  final bool isPassword;
  final bool obscureText;
  final int? minLines;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onsuffixIconPressed;
  final void Function()? onprefixIconPressed;
  final void Function()? onPressed;
  final TextInputType keyboardType;
  final String? error;
  final int? maxLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatter;
  final TextAlign textAlign;
  final bool readOnly;
  final bool? expands;
  final double? borderWidth;
  final double? borderRadius;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Color? enableBorderColor;
  final InputBorder? border;
  final EdgeInsets? padding;
  final String? Function(String? value)? validator;
  final bool autofocus;

  const CustomTextField({
    Key? key,
    this.onPressed,
    this.border,
    this.expands,
    this.enableBorderColor,
    this.onsuffixIconPressed,
    this.onprefixIconPressed,
    this.formatter,
    this.borderWidth = 1,
    this.borderRadius,
    this.fillColor,
    this.controller,
    this.hintText = '',
    this.title = '',
    this.subTitle = '',
    this.isPassword = false,
    this.minLines = 1,
    this.maxLines = 2,
    this.isEmail = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.obscureText = false,
    this.error,
    this.titleHintText = '',
    this.readOnly = false,
    this.onChanged,
    this.label = '',
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.padding,
    this.validator,
    this.autofocus = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title.isNotEmpty
              ? Text(
            widget.title,
            style: AppTextStyle.regular14.copyWith(
              color: widget.error == null ? AppColor.text1 : AppColor.black,
            ),
          )
              : const SizedBox(),
          widget.title.isNotEmpty ? SizedBox(height: Sizes.dimen_6) : const SizedBox(),
          widget.titleHintText.isNotEmpty
              ? Text(
            widget.titleHintText,
            style: AppTextStyle.regular12.copyWith(
              color: AppColor.grey,
            ),
          )
              : const SizedBox(),
          widget.titleHintText.isNotEmpty ? SizedBox(height: Sizes.dimen_6) : const SizedBox(),
          TextFormField(
            expands: widget.expands ?? false,
            onTap: widget.onPressed,
            textInputAction: TextInputAction.done,
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            readOnly: widget.readOnly,
            textAlign: widget.textAlign,
            inputFormatters: widget.formatter,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            controller: widget.controller,
            style: AppTextStyle.regular14.copyWith(color: AppColor.text1),
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            decoration: InputDecoration(
              label: widget.label.isNotEmpty
                  ? Text(
                widget.label,
                style: const TextStyle(color: AppColor.grey),
              )
                  : null,
              counterText: widget.maxLength == 500 ? null : '',
              suffixIcon: widget.suffixIcon != null
                  ? IconButton(
                  icon: widget.suffixIcon!, onPressed: widget.onsuffixIconPressed ?? () {})
                  : null,
              prefixIcon: widget.prefixIcon != null
                  ? IconButton(
                  icon: widget.prefixIcon!, onPressed: widget.onprefixIconPressed ?? () {})
                  : null,
              focusColor: AppColor.text3,
              fillColor: widget.fillColor ?? AppColor.transparent,
              filled: true,
              border: widget.border ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.dimen_8),
                    borderSide: const BorderSide(color: AppColor.transparent, width: 1),
                  ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? Sizes.dimen_8),
                borderSide: BorderSide(
                    color: widget.enableBorderColor ?? AppColor.transparent,
                    width: widget.borderWidth ?? Sizes.dimen_1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? Sizes.dimen_8),
                borderSide: BorderSide(color: AppColor.grey, width: widget.borderWidth ?? Sizes.dimen_1),
              ),
              hintText: widget.hintText,
              hintStyle: AppTextStyle.regular14.copyWith(
                color: AppColor.black.withOpacity(0.5),
              ),
              errorText: widget.error,
              errorStyle: AppTextStyle.regular12.copyWith(color: AppColor.black),
              contentPadding: EdgeInsets.only(left: Sizes.dimen_16, top: Sizes.dimen_2, right: Sizes.dimen_12),
            ),
          ),
          widget.subTitle.isNotEmpty ? SizedBox(height: Sizes.dimen_6) : const SizedBox(),
          widget.subTitle.isNotEmpty
              ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.subTitle,
                style: AppTextStyle.regular14.copyWith(
                    color: widget.error == null ? AppColor.text1 : AppColor.black,
                    fontSize: Sizes.dimen_12),
              ),
            ],
          )
              : const SizedBox(),
        ],
      ),
    );
  }
}
