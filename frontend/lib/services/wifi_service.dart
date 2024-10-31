import 'package:wifi_info_flutter/wifi_info_flutter.dart';

class WifiService {
  Future<String?> getCurrentSSID() async {
    try {
      return await WifiInfo().getWifiName();
    } catch (e) {
      print("Failed to get Wi-Fi SSID: $e");
      return null;
    }
  }
}
