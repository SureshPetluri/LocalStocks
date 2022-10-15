// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
//
// class NetworkUtils {
//   static StreamSubscription? subscription; // ignore: cancel_subscriptions
//   static Future<Null> Function(ConnectivityResult result)? networkListener;
//   static bool isConnectNetwork =false;
//   static streamSubscribeConnectivityListener() {
//     isConnectNetwork =false;
//    // Get.find<NetworkCheckController>().isNetworkCheck(false);
//     networkListener = (ConnectivityResult result) async {
//      // DebugUtils.printAsdf("NETWORK Connectivity $result");
//       switch (result) {
//         case ConnectivityResult.wifi:
//         case ConnectivityResult.ethernet:
//         case ConnectivityResult.mobile:
//         case ConnectivityResult.bluetooth:
//         isConnectNetwork =true;
//          // Get.find<NetworkCheckController>().isNetworkCheck(true);
//           break;
//         case ConnectivityResult.none:
//           isConnectNetwork = false;
//          // Get.find<NetworkCheckController>().isNetworkCheck(false);
//           break;
//       }
//     };
//     subscription = Connectivity().onConnectivityChanged.listen(networkListener);
//   }
// }
