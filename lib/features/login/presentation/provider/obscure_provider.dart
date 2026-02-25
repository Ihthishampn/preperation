import 'package:flutter/material.dart';

class ObscureProvider with ChangeNotifier {
  bool obscure = true;

  void changeObscure() {
    obscure = !obscure;
    notifyListeners();
  }
}
