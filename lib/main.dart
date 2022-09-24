import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/control/LoginController.dart';
import 'package:fooddeliveryapp/provider/home_page_provider.dart';
import 'package:fooddeliveryapp/view/homePage.dart';
import 'package:fooddeliveryapp/view/loginPage.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'control/homePageProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseLogin()),
        ChangeNotifierProvider(create: (context) => HomePageProvider())
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          );
        },
      ),
    );
  }
}
