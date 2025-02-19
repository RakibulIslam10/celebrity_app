import 'package:flutter/cupertino.dart';

class PaymentProvider extends ChangeNotifier {
  PaymentMethod _selectedPayment = PaymentMethod.paypal;

  PaymentMethod get selectedPayment => _selectedPayment;

  void selectPayment(PaymentMethod payment) {
    _selectedPayment = payment;
    notifyListeners();
  }
}

enum PaymentMethod {
  paypal,
  googlePay,
}