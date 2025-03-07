import 'package:flutter/material.dart';

class DbrandSkinSelection extends StatelessWidget {
  const DbrandSkinSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DBrand Skin Selection'),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Placeholder(),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "Title",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
