```dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/habit_tracking_screen.dart';
import 'screens/learning_screen.dart';
import 'screens/event_map_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoMission',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
