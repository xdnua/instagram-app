import 'package:flutter/cupertino.dart';

extension BuildContextExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  EdgeInsets get padding => MediaQuery.of(this).padding;
}
