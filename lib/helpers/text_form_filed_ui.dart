// ignore_for_file: missing_return

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsweb/helpers/themes.dart';

import 'convert_arabic_numbers_to_english_number.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key key,
    this.onChanged,
    this.SuffixIcon,
    this.initialValue,
    this.labelText,
    this.maxLines,
    this.numbersOnly,
    this.width,
    this.email,
  }) : super(key: key);
  final String initialValue, labelText;
  final int maxLines;
  final bool numbersOnly, email;
  final Widget SuffixIcon;

  final double width;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final List<String> acceptedNumbers = [
      '78',
      '75',
      '77',
      '79',
      '12',
      '11',
      '15',
      '10',
    ];
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: const Color(0xff232c51),
          border: Border.all(color: Colors.blue)),
      child: TextFormField(
        style: MainTheme.textFormFieldTextStyle.copyWith(color: Colors.white),
        initialValue: initialValue,
        keyboardType: numbersOnly == true ? TextInputType.number : null,
        inputFormatters: numbersOnly == true
            ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
            : null,
        maxLines: maxLines,
        maxLength: numbersOnly == true ? 11 : null,
        onChanged: onChanged,
        validator: (v) {
          if (v.isEmpty) {
            return 'يرجي ملئ الحقل وعدم تركه فارغ';
          }
          if (v.length < 4) {
            return 'يرجي ادخال بيانات حقيقيه كامله';
          }
          if (numbersOnly == true) {
            v = convertToEnglishNumbers(v.trim());
            bool phoneNumberAccepted = false;
            if (v.startsWith('0')) {
              v = v.substring(1, v.length);
            }
            for (String char in acceptedNumbers) {
              phoneNumberAccepted = v.startsWith(char);
              log(
                phoneNumberAccepted.toString(),
              );
              log(v);
              if (phoneNumberAccepted) {
                break;
              }
            }
            if (phoneNumberAccepted == false) {
              return 'رقم هاتف غير صالح';
            }
            if (v.length < 10) {
              return 'رقم هاتف قصير';
            }
          }
          if (email == true && !v.contains('@')) {
            return 'يرجي ادخال بريد الكتروني حقيقي';
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          counterText: "",
          labelText: labelText,
          suffixIcon: SuffixIcon,
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          border: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: Theme.of(context).errorColor,
            ),
          ),
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
