import 'package:celebrity/providers/auth/dropdown_controller.dart';
import 'package:celebrity/providers/booking.dart';
import 'package:celebrity/providers/faq/faq_provider.dart';
import 'package:celebrity/providers/kyc/kyc.dart';
import 'package:celebrity/providers/main_profile/main_profile.dart';
import 'package:celebrity/providers/navigation.dart';
import 'package:celebrity/providers/onboard/onboard_provider.dart';
import 'package:celebrity/providers/paymet/payment.dart';
import 'package:celebrity/providers/profile_card.dart';
import 'package:celebrity/providers/recoded_video/recoded_video_provider.dart';
import 'package:celebrity/providers/test.dart';
import 'package:celebrity/providers/video_call/video_call_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth/auth_provider.dart';
import 'providers/auth/splash_controller.dart';
import 'app.dart';
import 'providers/profile_provider.dart';
import 'providers/video_bites/video_player_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DropdownProvider()),
        ChangeNotifierProvider(create: (_) => ProfileCardProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => TabProvider()),
        ChangeNotifierProvider(create: (_) => KYCProvider()),
        ChangeNotifierProvider(create: (_) => RecodedVideoProvider()),
        ChangeNotifierProvider(create: (_) => FAQProvider()),
        ChangeNotifierProvider(create: (_) => MainProfile()),
        ChangeNotifierProvider(create: (_) => TestProvider()),
        ChangeNotifierProvider(create: (_) => VideoCallProvider()),
        ChangeNotifierProvider(create: (_) => VideoProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => DropdownProvider()),
        ChangeNotifierProvider(create: (context) => SplashProvider(context)),
      ],
      child: const MyApp(),
    ),
  );
}
