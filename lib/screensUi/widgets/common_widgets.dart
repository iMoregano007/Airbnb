import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/app_colors.dart';

SizedBox get h10 => const SizedBox(
      height: 10,
    );

SizedBox get h15 => const SizedBox(
      height: 15,
    );

SizedBox get h20 => const SizedBox(
      height: 20,
    );

SizedBox get h30 => const SizedBox(
      height: 30,
    );

SizedBox get h40 => const SizedBox(
      height: 40,
    );

SizedBox get h5 => const SizedBox(
      height: 5,
    );

SizedBox get h50 => const SizedBox(
      height: 50,
    );

SizedBox get w5 => const SizedBox(
      width: 5,
    );

SizedBox get w10 => const SizedBox(
      width: 10,
    );

SizedBox get w15 => const SizedBox(
      width: 15,
    );

SizedBox get w20 => const SizedBox(
      width: 20,
    );

SizedBox get w30 => const SizedBox(
      width: 30,
    );

OutlineInputBorder get border => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide:
        BorderSide(width: 0.87, color: AppColors.black.withOpacity(0.4)));
OutlineInputBorder get focusedBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide:
        BorderSide(width: 0.87, color: AppColors.black.withOpacity(0.4)));
OutlineInputBorder get errorBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide:
        BorderSide(width: 0.87, color: AppColors.black.withOpacity(0.4)));

OutlineInputBorder get borderNoWidth => OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(width: 0, color: Colors.transparent));
OutlineInputBorder get focusedBorderNoWidth => OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(width: 0, color: Colors.transparent));
OutlineInputBorder get errorBorderNoWidth => OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(width: 0, color: Colors.transparent));

ButtonTheme commonDropDownButton(
    {Widget? prefixIcon,
    Widget? suffixIcon,
    Color iconColor = AppColors.primaryColor,
    bool isMandatory = true,
    String? selectedValue,
    required List<String> values,
    required String title,
    required String hintText,
    required Function(String? value) onChange,
    Color fillColor = AppColors.white,
    bool isBorder = true,
    FocusNode? focusNode}) {
  return ButtonTheme(
    alignedDropdown: true,
    child: DropdownButtonFormField(
      value: selectedValue,
      focusNode: focusNode,
      style: TextStyle(
          fontSize: 12,
          color:
              fillColor != AppColors.white ? AppColors.white : AppColors.black,
          letterSpacing: 0.2,
          fontWeight: FontWeight.w600),
      hint: Text(
        hintText,
        style: TextStyle(
            fontSize: 12,
            color: fillColor != AppColors.white
                ? AppColors.white
                : AppColors.black.withOpacity(0.4),
            fontWeight: FontWeight.w300),
      ),
      items: values.map((e) {
        return DropdownMenuItem(value: e, child: Text(e));
      }).toList(),
      onChanged: (val) {
        onChange(val);
      },
      icon: Icon(
        Icons.keyboard_arrow_down,
        size: 16,
        color:
            fillColor == AppColors.primaryColor ? AppColors.white : iconColor,
      ),
      validator: (value) {
        if (isMandatory) {
          if (value == null || value.isEmpty) {
            return 'Please Select $title';
          }
        }

        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      dropdownColor: fillColor,
      decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          errorMaxLines: 2,
          errorStyle: const TextStyle(
              fontSize: 12,
              fontFamily: 'CustomFonts',
              letterSpacing: 0.3,
              color: AppColors.red),
          prefixIcon: prefixIcon,
          counterText: '',
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 12,
              color: AppColors.black.withOpacity(0.4),
              fontWeight: FontWeight.w300),
          isCollapsed: true,
          border: isBorder ? border : borderNoWidth,
          enabledBorder: isBorder ? border : borderNoWidth,
          focusedBorder: isBorder ? focusedBorder : focusedBorderNoWidth,
          disabledBorder: isBorder ? border : borderNoWidth,
          focusedErrorBorder: isBorder ? errorBorder : errorBorderNoWidth,
          errorBorder: isBorder ? errorBorder : errorBorderNoWidth,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 12)),
    ),
  );
}

Widget commonTextField(
    {required BuildContext context,
    Function(String? value)? onChange,
    FocusNode? focusNode,
    required TextEditingController controller,
    required String title,
    String? hintText,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    Widget? suffix,
    Widget? preffix,
    bool isRead = false,
    bool obscureText = false,
    double? wid,
    bool isMendatory = true,
    int length = 256,
    RegExp? textRegex,
    int? maxLines = 1,
    Function()? onTap,
    Color textColor = AppColors.black,
    Color fillColor = AppColors.white,
    bool isBorder = true}) {
  return SizedBox(
    width: wid ?? MediaQuery.of(context).size.width,
    child: TextFormField(
      maxLines: maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters ?? [],
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      cursorColor: AppColors.primaryColor,
      readOnly: isRead,
      focusNode: focusNode,
      obscureText: obscureText,
      maxLength: length,
      obscuringCharacter: '●',
      onChanged: onChange ?? (value) {},
      style: TextStyle(
          fontSize: 16,
          fontFamily: 'CustomFont',
          color: textColor,
          fontWeight: FontWeight.w600),
      validator: (value) {
        if (isMendatory) {
          if (value!.isEmpty || value.trim().isEmpty) {
            return '$title can\'t be empty';
          } else if ((title == 'Mobile Number' ||
                  title == 'Phone Number' ||
                  title == 'Mobile no' ||
                  title == 'Phone no') &&
              value.length < 10) {
            return 'Please enter valid $title';
          } else if ((title == 'Pin code' || title == 'Post code') &&
              value.length < 6) {
            return 'Please enter valid $title';
          } else if ((title.contains('Password') ||
                  title.contains('password')) &&
              value.length < 4) {
            return '$title should contain minimum 4 characters';
          } else if (textRegex != null) {
            if (!textRegex.hasMatch(value)) {
              if (title.contains('Password') || title.contains('password')) {
                if (value.length < 4) {
                  return '$title should contain minimum 4 characters';
                }
                return '$title should contain special characters & numbers';
              } else {
                return 'Please Enter valid $title';
              }
            }
            return null;
          } else {
            return null;
          }
        } else {
          if (value!.isNotEmpty && textRegex != null) {
            if (!textRegex.hasMatch(value)) {
              return 'Please enter valid ${title.toLowerCase()}';
            }
            return null;
          }
          return null;
        }
      },
      onTap: onTap,
      decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          errorMaxLines: 3,
          prefixIcon: preffix,
          errorStyle: const TextStyle(
              fontSize: 14,
              fontFamily: 'CustomFonts',
              letterSpacing: 0.3,
              color: AppColors.red),
          counterText: '',
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 16,
              color: AppColors.black,
              fontFamily: 'CustomFonts',
              fontWeight: FontWeight.w300),
          border: isBorder ? border : borderNoWidth,
          enabledBorder: isBorder ? border : borderNoWidth,
          focusedBorder: isBorder ? focusedBorder : focusedBorderNoWidth,
          disabledBorder: isBorder ? border : borderNoWidth,
          focusedErrorBorder: isBorder ? errorBorder : errorBorderNoWidth,
          suffixIcon: suffix,
          errorBorder: isBorder ? errorBorder : errorBorderNoWidth,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
    ),
  );
}
