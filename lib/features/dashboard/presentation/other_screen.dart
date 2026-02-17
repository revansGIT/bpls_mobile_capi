import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  final String title;

  const OtherScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("কোন তথ্য পাওয়া যায়নি")),
    );
  }
}
