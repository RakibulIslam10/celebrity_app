import 'package:celebrity/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/assets.dart';
import '../../providers/paymet/payment.dart';

class PaymentSelection extends StatelessWidget {
  const PaymentSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        PaymentOption(
          img: Image.asset(AppAssets.paypal),
          isSelected: paymentProvider.selectedPayment == PaymentMethod.paypal,
          onTap: () {
            paymentProvider.selectPayment(PaymentMethod.paypal);
          },
        ),
        const SizedBox(height: 12),
        PaymentOption(
          img: Image.asset(AppAssets.google),
          isSelected:
              paymentProvider.selectedPayment == PaymentMethod.googlePay,
          onTap: () {
            paymentProvider.selectPayment(PaymentMethod.googlePay);
          },
        ),
      ],
    );
  }
}

class PaymentOption extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final Widget img;

  const PaymentOption({
    required this.isSelected,
    required this.onTap,
    super.key,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.purple : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
        child: Row(
          children: [
            img,
            Spacer(),
            Radio(
              value: true,
              groupValue: isSelected,
              onChanged: (_) => onTap(),
              activeColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
