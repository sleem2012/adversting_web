import 'package:flutter/material.dart';
import 'package:whatsweb/helpers/app_config.dart';

class TextFormFieldItemUi extends StatelessWidget {
  const TextFormFieldItemUi(
      {Key key,
      @required this.iconPath,
      @required this.OnChanged,
      @required this.title,
      @required this.maxLines,
      @required this.minLines,
      @required this.textInputType,
      @required this.ownFocus,
      @required this.nextFocus})
      : super(key: key);
  final IconData iconPath;
  final Function OnChanged;

  final String title;
  final int minLines;
  final int maxLines;
  final TextInputType textInputType;
  final FocusNode ownFocus;
  final FocusNode nextFocus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
        iconPath,
          size: 15.0,
          color: appConfig.colorMain,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
            child: Column(
          children: [
            TextFormField(
              validator: (v) {
                if (v.isEmpty) {
                  return 'ادخل البيانات';
                }
                return null;
              },
              onChanged: OnChanged,
              focusNode: ownFocus,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(nextFocus);
              },
              keyboardType: textInputType,
              maxLines: maxLines,
              minLines: minLines,
              style: TextStyle(
                  color: appConfig.colorText,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: title,
                hintStyle: TextStyle(
                    color: appConfig.colorText,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Divider(
              height: 1.0,
              color: appConfig.colorText.withOpacity(0.75),
            )
          ],
        ))
      ],
    );
  }
}
