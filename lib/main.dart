import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/screen/s_home.dart';

import 'widget/w_bottom_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cloneFlix',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
        ).copyWith(secondary: Colors.white),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const HomeScreen(),
              Container(
                color: Colors.black,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.green,
              ),
            ],
          ),
          bottomNavigationBar: const BottomBar(),
        ),
      ),
    );
  }
}
