import 'dart:ui';

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
      debugShowCheckedModeBanner: false,
      title: 'Glass Morphism',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade300,
      //1- first container is the background
      body: Container(
        decoration: const BoxDecoration(
          // network image for background you can use color or any background
          image: DecorationImage(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlO4zh2g8Y6RfzImP2Vz2AVy2v1I49HTSSUQ&usqp=CAU'),
              fit: BoxFit.cover),
        ),
        // 2- alignment the content at the center of screen
        alignment: Alignment.center,
        // 3- clipRRect to make a radius
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          // 4- backdropFilter to make some blur on second Container
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            // 5- second container with height and width this is will be the glass
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                // 6- add gradient color to the container
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white60, Colors.white10]),
                // 7- some radius
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 2, color: Colors.white30),
              ),
              // 8- the text inside the glass container
              child: const Center(
                child: Text(
                  'Glass',
                  style: TextStyle(fontSize: 80, color: Colors.white54),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
