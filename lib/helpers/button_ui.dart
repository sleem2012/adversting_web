
import 'package:flutter/material.dart';

class ButtonUi extends StatelessWidget {
  final double w;
  final double padding;
  final Widget widget;
  final Color backColor;
  final Color borderColor;
final Function func;
  const ButtonUi(
      {Key key,
      @required  this.w,
    @required  this.padding,
      @required  this.widget,
      @required this.func,
      @required  this.backColor,  this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(decoration: BoxDecoration( color: backColor,border: Border.all(width: 1.0,color: borderColor)),
          padding: EdgeInsets.all(padding),
          alignment: Alignment.center,
          width: w,
          child: widget),
    );
  }
}
