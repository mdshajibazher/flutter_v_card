import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v_card/pages/contact_details_page.dart';
import 'package:v_card/pages/form_page.dart';
import 'package:v_card/pages/home_page.dart';
import 'package:v_card/pages/scan_page.dart';
import 'package:v_card/providers/contact_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) => ContactProvider(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Homepage.routeName,
      routes: {
          Homepage.routeName : (context) => const Homepage(),
          ScanPage.routeName : (context) => const ScanPage(),
          FormPage.routeName : (context) => const FormPage(),
          ContactDetailsPage.routeName : (context) => const ContactDetailsPage(),
      },
    );
  }
}

