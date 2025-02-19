import 'package:celebrity/views/auth/sign_in/otp_verification_screen.dart';
import 'package:celebrity/views/booking/booking_screen.dart';
import 'package:celebrity/views/congratulation/congratulation_screen.dart';
import 'package:celebrity/views/fan_card/fan_card_screen.dart';
import 'package:celebrity/views/fan_card_preview/fan_card_preview_screen.dart';
import 'package:celebrity/views/navigation/navigation_screen.dart';
import 'package:celebrity/views/onboard/onboard_screen.dart';
import 'package:celebrity/views/payment/payment_screen.dart';
import 'package:celebrity/views/recoded_videos/recoded_videos.dart';
import 'package:celebrity/views/select_person/fav_person_selected_screen.dart';
import 'package:celebrity/views/subscription/subscription_screen.dart';
import 'package:celebrity/views/terms_condition/terms_screen.dart';
import 'package:celebrity/views/video_call/video_call_details_screen.dart';
import 'package:flutter/material.dart';
import '../views/about_screen/about_screen.dart';
import '../views/auth/sign_in/login_screen.dart';
import '../views/auth/splash_screen.dart';
import '../views/book_actor/book_an_actor_screen.dart';
import '../views/book_actor/booking_actor_details.dart';
import '../views/book_actor/booking_actor_payment_screen.dart';
import '../views/book_actor/booking_request_screen.dart';
import '../views/book_actor/payment_success_screen.dart';
import '../views/contact_us/contact_us_screen.dart';
import '../views/faq_screen/faq_screen.dart';
import '../views/home/home_screen.dart';
import '../views/kyc_verification/kyc_otp_verification.dart';
import '../views/kyc_verification/kyc_screen.dart';
import '../views/personal_meetup/meetup_payment_screen.dart';
import '../views/personal_meetup/meetup_details_screen.dart';
import '../views/personal_meetup/meetup_status_screen.dart';
import '../views/personal_meetup/payment_success_meetup_screen.dart';

import '../views/personal_meetup/personal_meetup_screen.dart';
import '../views/profile/profile_screen.dart';
import '../views/thankyou_screen/thank_you_screen.dart';
import '../views/video_call/call_payment_screen.dart';
import '../views/video_call/call_payment_success.dart';
import '../views/video_call/video_call_booking_screen.dart';
import '../views/video_call/video_calling_screen.dart';
import '../views/video_call/video_calls_screen.dart';
import '../views/video_bites/video_bites_book_screen.dart';
import '../views/video_bites/video_bites_screen.dart';
import '../views/video_bites/video_congratulations_screen.dart';
import '../views/video_bites/video_download_screen.dart';
import '../views/video_bites/video_payment_screen.dart';
import '../views/video_bites/video_player_screen.dart';
import '../views/wallet_compact/wallet_compact_screen.dart';
import '../views/welcome_screen/welcome_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/splash': (context) => const SplashScreen(),
    '/home': (context) => const HomeScreen(),
    '/login': (context) => const LoginScreen(),
    '/otp': (context) => const OtpVerificationScreen(),
    '/fanCard': (context) => const FanCardScreen(),
    '/fanCardPreview': (context) => const FanCardPreviewScreen(),
    '/subscription': (context) => const SubscriptionScreen(),
    '/selectPerson': (context) => const FavPersonSelectedScreen(),
    '/profile': (context) => const ProfileScreen(),
    '/payment': (context) => const PaymentScreen(),
    '/congratulation': (context) => const CongratulationScreen(),
    '/onboard': (context) => OnboardingScreen(),
    '/navigation': (context) => NavigationScreen(),
    '/booking': (context) => const BookingScreen(),

    //book actor
    '/bookAnActor': (context) => const BookAnActorScreen(),
    '/bookAnActorRequest': (context) => BookAnActorRequestScreen(),
    '/bookingActorPaymentScreen': (context) =>
        const BookingActorPaymentScreen(),
    '/paymentSuccessScreen': (context) => const PaymentSuccessScreen(),
    '/bookingActorDetailsScreen': (context) =>
        const BookingActorDetailsScreen(),

    //video bites
    '/videoBitesScreen': (context) => const VideoBitesScreen(),
    '/videoBitesBookScreen': (context) => VideoBitesBookScreen(),
    '/videoBitesPaymentScreen': (context) => const VideoBitesPaymentScreen(),
    '/videoPaymentSuccessScreen': (context) =>
        const VideoPaymentSuccessScreen(),
    '/videoDownloadScreen': (context) => const VideoDownloadScreen(),
    '/videoPlayerScreen': (context) => const VideoPlayerScreen(),

    '/welcomeScreen': (context) => const WelcomeScreen(),
    '/kyc': (context) => const KYCVerificationScreen(),
    '/recodedVideosScreen': (context) => const RecodedVideos(),
    '/kycOtpVerification': (context) => const KycOtpVerification(),
    '/contactUS': (context) => const ContactUsScreen(),
    '/aboutScreen': (context) => const AboutScreen(),
    '/faq': (context) => FAQScreen(),
    '/walletCompactScreen': (context) => WalletScreen(),
    '/terms': (context) => const TermsScreen(),

    // personals
    '/personalMeetupScreen': (context) => const PersonalMeetupScreen(),
    '/personalMeetupDetailsScreen': (context) =>
        const PersonalMeetupDetailsScreen(),
    '/meetupPaymentScreen': (context) => const MeetupPaymentScreen(),
    '/personalMeetupStatusScreen': (context) => PersonalMeetupStatusScreen(),
    '/paymentSuccessMeetupScreen': (context) =>
        const PaymentSuccessMeetupScreen(),

    //video call
    '/videoCallsScreen': (context) => const VideoCallsScreen(),
    '/videoCallBookingScreen': (context) => const VideoCallBookingScreen(),
    '/callingScreen': (context) => const VideoCallScreen(),
    '/callPaymentSuccessScreen': (context) => const CallPaymentSuccessScreen(),
    '/videoCallDetails': (context) => const VideoCallDetailsScreen(),

    '/ThankYouScreen': (context) => const ThankYouScreen(),
    '/callPaymentScreen': (context) => const CallPaymentScreen(),
  };
}
