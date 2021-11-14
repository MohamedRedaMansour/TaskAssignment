import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:link_assignment/pages/mainContainer/main_container.dart';

import 'di/binding.dart';
import 'pages/mainPage/ui/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E-Commerce",
        initialBinding: Binding(),
        home:  const Scaffold(
          body:  MainContainer(),
        )
    );
  }
}

