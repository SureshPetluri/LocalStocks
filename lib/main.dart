import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_stocks/routes/route_constants.dart';
import 'package:local_stocks/routes/route_pages.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:local_stocks/utils/network_utils.dart';
import 'package:local_stocks/view/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
  runApp(LocalStocks());
}

class LocalStocks extends StatelessWidget with WidgetsBindingObserver {
  LocalStocks({Key? key}) : super(key: key) {
    WidgetsBinding.instance?.addObserver(this);
    // NetworkUtils.streamSubscribeConnectivityListener();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Local Stocks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomeScreen(),
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          bottom: !NetworkUtils.isConnectNetwork
              ? PreferredSize(
                  preferredSize: Size(MediaQuery.of(context).size.width, 50),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blueGrey,
                    child: const Text(
                      "No Network Connectivity",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : PreferredSize(
                  preferredSize: Size(MediaQuery.of(context).size.width, 1.0),
                  child: const SizedBox(),
                )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/
