import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Check a commit

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

Stream<String> getTime() => Stream.periodic(
      const Duration(milliseconds: 990),
      (_) => DateTime.now().toIso8601String(),
    );

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final datetime = useStream(getTime());

    return Scaffold(
      appBar: AppBar(
        title: Text(datetime.data ?? 'datetime.data is null'),
      ),
    );
  }
}
