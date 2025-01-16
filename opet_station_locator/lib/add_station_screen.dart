import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddStationScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lngController = TextEditingController();

  final CollectionReference stations =
      FirebaseFirestore.instance.collection('stations');

  Future<void> addStation(String name, double latitude, double longitude) {
    return stations
        .add({
          'name': name,
          'latitude': latitude,
          'longitude': longitude,
        })
        .then((value) => print("Station Added"))
        .catchError((error) => print("Failed to add station: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Opet Station'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'İstasyon Adı'),
            ),
            TextField(
              controller: _latController,
              decoration: InputDecoration(labelText: 'Enlem (Latitude)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _lngController,
              decoration: InputDecoration(labelText: 'Boylam (Longitude)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String name = _nameController.text;
                final double latitude = double.parse(_latController.text);
                final double longitude = double.parse(_lngController.text);
                addStation(name, latitude, longitude);
              },
              child: Text('İstasyon Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
