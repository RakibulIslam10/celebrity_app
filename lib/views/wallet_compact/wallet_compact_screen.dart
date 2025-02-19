import 'package:celebrity/core/utils/app_color.dart';
import 'package:celebrity/core/utils/assets.dart';
import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/strings.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> transactions = List.generate(
    4,
    (index) => {'amount': '₹4,000', 'date': '09/12/2024 2:30 PM'},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpacingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _walletBalanceWidget(context),
            _rechargeFieldWidget(),
            SizedBox(height: Dimensions.verticalSpacingLarge),
            Text(
              AppStrings.transactionHistory,
              style: TextStyle(
                  fontSize: Dimensions.fontSizeLarge,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColors.whiteColor,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: const Text("Deposit"),
                      subtitle: Text(transactions[index]['date']),
                      trailing: Text(
                        transactions[index]['amount'],
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _walletBalanceWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Text(
          AppStrings.Wallet,
          style: TextStyle(
              fontSize: Dimensions.fontSizeLarge * 1.8,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: Dimensions.verticalSpacingLarge),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.22,
            width: MediaQuery.of(context).size.width * 0.44,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppAssets.subtract,
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: mainCenter,
              children: [
                const Text(
                  AppStrings.myBalance,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: Dimensions.verticalSpacingLarge * 0.2),
                Text(
                  "₹43,899",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: Dimensions.fontSizeLarge * 1.6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: Dimensions.verticalSpacingLarge * 2),
      ],
    );
  }

  Row _rechargeFieldWidget() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: AppStrings.enterAmount,
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xffD032A4),
                Color(0xff4E368E),
              ], // Adjust colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius),
              ),
            ),
            onPressed: () {},
            child: const Text(
              AppStrings.Recharge,
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
        ),
      ],
    );
  }
}
