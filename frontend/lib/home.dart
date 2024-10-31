import 'package:flutter/material.dart';
import 'services/wifi_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final WifiService wifiService = WifiService();

  String? ssid;

  @override
  void initState() {
    super.initState();
    fetchSSID();
  }

  Future<void> fetchSSID() async {
    String? currentSSID = await wifiService.getCurrentSSID();
    print('Current SSID: $currentSSID'); // Log the SSID
    setState(() {
      ssid = currentSSID;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wi-Fi Detection Example'),
      ),
      body: Center(
        child: Text(ssid != null
            ? 'Connected to Wi-Fi: $ssid'
            : 'No Wi-Fi connection detected'),
      ),
    );
  }
}
