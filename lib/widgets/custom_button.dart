import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String? amount;
  final VoidCallback onPressed;
  final double height;
  final double radius;

  const CustomButton({
    Key? key,
    required this.text,
    this.amount,
    required this.onPressed,
    this.height = 50,
    this.radius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 4,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xffD032A4),
                Color(0xff4E368E),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Container(
            alignment: Alignment.center,
            child: amount == null
                ? Text(
                    text,
                    style: AppTextStyles.title.copyWith(
                      color: Colors.white,
                      fontSize: Dimensions.fontSizeMedium,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: AppTextStyles.title.copyWith(
                          color: Colors.white,
                          fontSize: Dimensions.fontSizeMedium,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        amount!,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: Dimensions.fontSizeLarge,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
