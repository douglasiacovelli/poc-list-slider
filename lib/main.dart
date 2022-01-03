import 'dart:math';

import 'package:carousel_animation/animated_carousel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Transform.rotate(
              angle: 340 * (pi / 180),
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width * 1.5,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    SizedBox(child: AnimatedCarousel(), height: 72),
                    SizedBox(height: 8),
                    SizedBox(child: AnimatedCarousel(reverse: true), height: 72),
                    SizedBox(height: 8),
                    SizedBox(child: AnimatedCarousel(), height: 72),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
