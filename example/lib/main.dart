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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularAnimationSplash(
      color: Theme.of(context).accentColor,
      logo: Text(
        'logickoder',
        style: Theme.of(context).textTheme.headline3?.copyWith(
              color: Colors.yellow[900],
            ),
      ),
      screen: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.separated(
          itemBuilder: (_, index) => Text('$index'),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: 100,
        ),
      ),
      duration: const Duration(seconds: 6),
      numberOfCircles: 3,
      circleDifference: 100,
    );
  }
}
