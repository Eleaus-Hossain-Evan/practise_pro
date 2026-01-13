import 'package:flutter/material.dart';

import 'dbrand_skin_selection/dbrand_skin_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DbrandSkinSelection(),
    );
  }
}
