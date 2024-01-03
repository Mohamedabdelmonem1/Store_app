import 'package:flutter/material.dart';
import 'package:store_app/pages/category_details.dart';
import 'package:store_app/pages/homepage.dart';
import 'package:store_app/pages/update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'HomePage': (context) => const HomePage(),
        'UpdatePage': (context) => const UpdateProductPage(),
        'CategoryDetails': (context) => const CategoryDetails(),
      },
      initialRoute: 'HomePage',
      // home: HomePage(),
    );
  }
}
