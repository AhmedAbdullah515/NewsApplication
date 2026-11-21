import 'package:flutter/material.dart';
import 'package:full_application/Providers/articleprovider.dart';
import 'package:full_application/Providers/authprovider.dart';
import 'package:full_application/Screens/homepage.dart';
import 'package:full_application/Screens/signupPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Authprovider()),
        ChangeNotifierProvider(create: (context) => Articleprovider()),
      ],
      child: MaterialApp(home: Signuppage(), debugShowCheckedModeBanner: false),
    );
  }
}
