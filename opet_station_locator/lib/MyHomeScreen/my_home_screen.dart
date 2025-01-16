import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Opet İstasyonları butonuna tıklanma olayını buraya ekleyin
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Buton arka plan rengi
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Opet İstasyonları'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Google Maps ekranını açar
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoogleMapsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Buton arka plan rengi
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Google Maps'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // İstasyon Ekle butonuna tıklanma olayını buraya ekleyin
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Buton arka plan rengi
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('İstasyon Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleMapsScreen extends StatefulWidget {
  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(41.01637548242105, 29.0750852831582), // Üsküdar enlem-boylam değerleri
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _initialPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
