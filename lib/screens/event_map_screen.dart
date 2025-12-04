```dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventMapScreen extends StatefulWidget {
  @override
  _EventMapScreenState createState() => _EventMapScreenState();
}

class _EventMapScreenState extends State<EventMapScreen> {
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  Future<void> loadEvents() async {
    final events = await FirebaseFirestore.instance.collection('events').get();

    for (var doc in events.docs) {
      final data = doc.data();
      _markers.add(Marker(
        markerId: MarkerId(doc.id),
        position: LatLng(data['lat'], data['lng']),
        infoWindow: InfoWindow(
          title: data['title'],
          snippet: data['description'],
        ),
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Clean-Up Events")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(20.5937, 78.9629), // Center of India
          zoom: 5,
        ),
        markers: _markers,
      ),
    );
    ```dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventMapScreen extends StatefulWidget {
  @override
  _EventMapScreenState createState() => _EventMapScreenState();
}

class _EventMapScreenState extends State<EventMapScreen> {
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  Future<void> loadEvents() async {
    final events = await FirebaseFirestore.instance.collection('events').get();

    for (var doc in events.docs) {
      final data = doc.data();
      _markers.add(Marker(
        markerId: MarkerId(doc.id),
        position: LatLng(data['lat'], data['lng']),
        infoWindow: InfoWindow(
          title: data['title'],
          snippet: data['description'],
        ),
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Clean-Up Events")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(20.5937, 78.9629), // Center of India
          zoom: 5,
        ),
        markers: _markers,
      ),
    );
  }
}
