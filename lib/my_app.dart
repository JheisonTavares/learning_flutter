import 'package:flutter/material.dart';

import 'presenter/home_page.dart'; 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      title: 'Meu App Flutter',
      home: const MyHomePage(title: 'Página inicial'),
    );
  }
}