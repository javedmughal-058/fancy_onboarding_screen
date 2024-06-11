import 'package:fancy_onboarding_screen/core/model/onboarding_item_model.dart';
import 'package:fancy_onboarding_screen/fancy_onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter OnBoarding Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter OnBoarding Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<OnBoardingItemModel> onBoardingItemList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FancyOnBoardingScreen(
          activeIndicatorColor: Colors.teal.shade700,
          boardingScreenColor: Colors.teal.shade700,
          onBoardingItems: [],
        ),
      ),
    );
  }
}
