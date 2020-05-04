import 'package:flutter/material.dart';
import 'package:flutter_movie/dashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xff1C1C1E)
      ),
      home: Detail(),
      builder: (context, child) {
        ScreenUtil.init(context, width: 750, height: 1334);
        return child;
      },
    );
  }
}
