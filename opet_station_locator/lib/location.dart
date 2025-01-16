import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      // İzin daha önce reddedildiyse tekrar istenir
      if (await Permission.location.request().isGranted) {
        // İzin verildi
        if (kDebugMode) {
          print("Konum izni verildi");
        }
      } else {
        // İzin verilmedi
        if (kDebugMode) {
          print("Konum izni verilmedi");
        }
      }
    } else if (status.isPermanentlyDenied) {
      // Kullanıcı izni kalıcı olarak reddettiyse, onu ayarlara yönlendirebilirsiniz
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konum İzni Örneği'),
      ),
      body: const Center(
        child: Text('Konum İzni İsteme Uygulaması'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}
