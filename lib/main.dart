import 'package:flutter/material.dart';
import 'package:shopping/Selectorr.dart';
import 'provider_of_context.dart';
import 'multi_providers_page.dart';
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
      home: MultiProviderPage(),
    );
  }
}
