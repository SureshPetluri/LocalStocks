import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_stocks/routes/route_constants.dart';
import 'package:local_stocks/routes/route_pages.dart';
import 'package:local_stocks/utils/network_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  kIsWeb
      ? await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform)
      : await Firebase.initializeApp();
  runApp(LocalStocks());
}

class LocalStocks extends StatelessWidget with WidgetsBindingObserver {
  LocalStocks({Key? key}) : super(key: key) {
    WidgetsBinding.instance?.addObserver(this);
     NetworkUtils.streamSubscribeConnectivityListener();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Local Stocks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomeScreen(),
      initialRoute:  AppRoutes.home,
      getPages: AppPages.routes,
    );
  }
}

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return webProduction;
  }

  static const FirebaseOptions webProduction = FirebaseOptions(
      apiKey: "AIzaSyD1FKakf6YCLLuEsTzulSIm4nJPh2BhEWo",
      authDomain: "localstocks-bf5ed.firebaseapp.com",
      projectId: "localstocks-bf5ed",
      storageBucket: "localstocks-bf5ed.appspot.com",
      messagingSenderId: "695192526641",
      appId: "1:695192526641:web:5fb0b133c0a4d059179a10",
      measurementId: "G-00J3TVPBJB");
}
