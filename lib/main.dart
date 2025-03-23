import 'package:financial_awareness/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class  MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '!Geaux Breauk!',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'ProximaNova',
      ),
      home: const LoginState(),
    );
  }
}