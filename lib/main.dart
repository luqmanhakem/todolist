import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todolist/ui/splash/splash_view.dart';

import 'app/locator.dart';
import 'app/router.gr.dart';

void main() {
  ///
  /// [INIT]
  ///
  WidgetsFlutterBinding.ensureInitialized();

  ///
  /// [LOCATOR] Init all dependencies injection (DI)
  ///
  setupLocator();
  setupHive();
  //setupLocalStorage();

  ///
  /// [STATUS BAR]
  ///
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));

  ///
  /// [RUN APPS]
  ///
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Etiqa Mobile App Developer Assessment',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Router().onGenerateRoute,
      // builder: ExtendedNavigator.b,
      navigatorKey: locator<NavigationService>().navigatorKey,
      home: SplashView(),
    );
  }
}
