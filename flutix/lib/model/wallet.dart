import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletProvider extends ChangeNotifier {
  double _saldo = 0.0;

  double get saldo => _saldo;

  void topUp(double amount) {
    _saldo += amount;
    notifyListeners();
  }

  static WalletProvider of(BuildContext context, {bool listen = false}) =>
      Provider.of<WalletProvider>(context, listen: listen);
}
