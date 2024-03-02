import 'package:flutter/material.dart';

void main() => runApp(const NumberTranslateApp());

class NumberTranslateApp extends StatelessWidget {
  const NumberTranslateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const _NumberTranslateApp();
  }
}

class _NumberTranslateApp extends StatelessWidget {
  const _NumberTranslateApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}