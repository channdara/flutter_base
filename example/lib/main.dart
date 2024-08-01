import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BaseStateful<MyApp> {
  final Dio _dio = Dio();

  @override
  void initStatePostFrameCallback() {
    _dio.get('https://jsonplaceholder.typicode.com/todos/1').then((response) {
      final data = response.data;
      print(data.toString());
    });
    super.initStatePostFrameCallback();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold());
  }
}
