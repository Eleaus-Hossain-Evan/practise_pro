import 'package:flutter/material.dart';

import 'dbrand_skin_selection/dbrand_skin_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Live Toggle Example")),
        body: const Center(
          child: DbrandSkinSelection(),
        ),
      ),
    );
  }
}
