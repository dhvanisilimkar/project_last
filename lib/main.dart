import 'package:flutter/material.dart';
import 'package:project_last/screens/home_page.dart';
import 'package:project_last/modal/pro_util.dart';
import 'package:project_last/utils/routes_util.dart';

void main() => runApp(
      const Myapp(),
    );

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.home_page: (context) => home_page(),
      },
    );
  }
}
