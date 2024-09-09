import 'package:flutter/material.dart';
import 'package:progress_bar_project/src/progress.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Progress(),
        floatingActionButton: FloatingActionButton.small(onPressed: () {}),
      ),
    );
  }
}
