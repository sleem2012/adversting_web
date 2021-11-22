
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:whatsweb/helpers/app_config.dart';
import 'package:whatsweb/helpers/mediaQuery.dart';

class RegisterField extends StatelessWidget {
  const RegisterField({
    Key key,
    this.verticalMargin,
    this.hintText,
    this.labelText,
    this.hintTextNoLocal,
    this.keyboardType,
    this.obsecureText = false,
    this.controller,
    this.validator,
    this.enableText = true,
    this.isDetails = false,
    this.formatter,
    this.suffixIcon,
    this.fillColor,
    this.verticalPadding,
    this.horizontalMargin,
    this.globalKey,
    this.onChanged,
    this.maxLines = 1,
  }) : super(key: key);

  final String hintText, labelText;
  final String hintTextNoLocal;
  final List<TextInputFormatter> formatter;
  final TextInputType keyboardType;
  final bool obsecureText;
  final void Function(String) onChanged;
  final String Function(String) validator;
  final TextEditingController controller;
  final bool enableText;
  final Widget suffixIcon;
  final bool isDetails;
  final Color fillColor;
  final double verticalPadding;
  final double horizontalMargin;
    final double verticalMargin;

  final Key globalKey;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: horizontalMargin ?? 15, vertical: verticalMargin??5),
      child: TextFormField(
        key: globalKey,
        onChanged: onChanged,
        inputFormatters: formatter,
        maxLines: isDetails ? null : 1,
        enabled: enableText,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        controller: controller,
        validator: validator,
        obscureText: obsecureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          
          fillColor: fillColor ?? Colors.transparent,
          filled: fillColor != null,
          labelText: labelText,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: appConfig.colorMain,
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: context.height * (verticalPadding ?? 0.022),
              horizontal: context.width * 0.02),
          suffixIcon: suffixIcon,
          errorStyle: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: appConfig.colorMain,
              width: 25,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: appConfig.colorMain,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: appConfig.colorMain,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: appConfig.colorMain,
              width: 2,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: appConfig.colorMain,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: Theme.of(context).errorColor,
            ),
          ),
    
          hintText: hintTextNoLocal ?? hintText == null
              ? null
              :hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
