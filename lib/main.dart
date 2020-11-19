import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petramobile/routes.dart';
import 'package:petramobile/services/snackbar.service.dart';

Future<void> main() async {
  Get.lazyPut(() => SnackbarService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'PetraMobile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        getPages: Routes.routes);
  }
}
