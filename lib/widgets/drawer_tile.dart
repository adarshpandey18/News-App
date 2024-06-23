import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final Function? function;
  final String text;

  const DrawerTile({super.key, required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.public), // Replace with appropriate icon
      title: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        if (function != null) {
          function!();
        }
      },
    );
  }
}
