
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OpetStationMap extends StatefulWidget {
  const OpetStationMap({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OpetStationMapState createState() => _OpetStationMapState();
}

class _OpetStationMapState extends State<OpetStationMap> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadStations();
  }

  void _loadStations() async {
    QuerySnapshot querySnapshot = await _firestore.collection('stations').get();
    for (var doc in querySnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      final marker = Marker(
        markerId: MarkerId(doc.id),
        position: LatLng(data['latitude'], data['longitude']),
        infoWindow: InfoWindow(title: data['name']),
      );
      setState(() {
        _markers.add(marker);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opet Stations'),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(41.015137, 28.979530), // İstanbul'un koordinatları
          zoom: 10,
        ),
        markers: _markers,
      ),
    );
  }
}
