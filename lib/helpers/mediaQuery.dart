// ignore_for_file: file_names

import 'package:flutter/widgets.dart';

extension ContextExtention on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;


}
