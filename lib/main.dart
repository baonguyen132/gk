import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gk/screens/dashboard/dashboard.dart';
import 'package:gk/screens/login/login.dart';
import 'package:gk/screens/signup/sign_up.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'theme/theme_provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Sử dụng cấu hình phù hợp với nền tảng hiện tại
  );

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider() ,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Theme.of(context).colorScheme.background ,
        child: Login(),
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        "/login": (context) => Login(),
        "/dashboard": (context) => Dashboard() ,
        "/signup": (context) => SignUp() ,
      },
    );
  }
}
