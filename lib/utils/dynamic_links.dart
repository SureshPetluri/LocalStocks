import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
class FirebaseUtils {
  static FirebaseAnalytics? analytics;
  static FirebaseAnalyticsObserver? analyticsObserver;

  /// Initializes Firebase
  static Future initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();
    analytics = FirebaseAnalytics.instance;
    analyticsObserver = FirebaseAnalyticsObserver(analytics: analytics!);
  }

  /// Observes Dynamic links when app is open
  static Future initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      final Uri? deepLink = dynamicLinkData?.link;

      if (deepLink != null) {
        if (deepLink
            .toString()
            .isNotEmpty) {
          // DebugUtils.printAsdf("OnDynamicLink $deepLink");
          // DebugUtils.printAsdf("Dynamic LINK ${deepLink.queryParameters}");

          List<String> strings =
              dynamicLinkData.link.toString().split('/') ?? [];
          if (strings[3] == "resetPassword") {
            //Get.toNamed(AppRoutes.resetPassword, arguments: strings);
          } else {
            //if (AuthRepository().getAuthToken() != null) {
            // Get.toNamed(AppRoutes.myCar);
            //   } else
            //    // Get.toNamed(AppRoutes.login);
            // }
          }
        }
      }
    }).onError((error) async {
      print('onLinkError');
      print(error.message);
    });
  }
}
