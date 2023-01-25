import 'package:circular_animation_splash/circular_animation_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersive,
      overlays: [
        SystemUiOverlay.bottom,
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raindrop App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: const Text('Circular Animation Splash'),
            ),
            body: const ExampleStartScreen(),
          ),
          CircularAnimationSplash(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}

class ExampleStartScreen extends StatelessWidget {
  const ExampleStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
    );
  }
}
