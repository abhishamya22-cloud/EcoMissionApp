[5:49 pm, 4/12/2025] Chat Gpt Prenium: dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class HabitTrackingScreen extends StatefulWidget {
  @override
  _HabitTrackingScreenState createState() => _HabitTrackingScreenState();
}

class _HabitTrackingScreenState extends State<HabitTrackingScreen> {
  final userId = FirebaseAuth.instance.currentUser?.uid ?? 'demoUser';
  final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
  Map<String, bool> habits = {
    'recycled': false,
    'reusable_bag': false,
    'public_transport': false,
  };

  @override
  void initState() {
    _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  final List<Map<String, String>> learningItems = [
    {
      'title': '5 Ways to Reduce Plastic Use',
      'desc': 'Tips on cutting down plastic daily.',
    },
    {
      'title': 'Why Trees Matter',
      'desc': 'Understand how trees help the climate.',
    },
  ];

  Set<int> readItems = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Learning Section")),
      body: ListView.builder(
        itemCount: learningItems.length,
        itemBuilder: (context, index) {
          final item = learningItems[index];
          final isRead = readItems.contains(index);
          return ListTile(
            title: Text(item['title']!),
            subtitle: Text(item['desc']!),
            trailing: ElevatedButton(
              onPressed: isRead
                  ? null
                  : () {
                      setState(() {
                        readItems.add(index);
                      });
                    },
              child: Text(isRead ? "Read" : "Mark Read"),
            ),
          );
        },
      ),
    );
  }
}
