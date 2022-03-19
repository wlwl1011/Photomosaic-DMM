import 'package:flutter/foundation.dart';

var serverAdr = "192.168.64.7:8080";

void init() {
  if (kIsWeb) {
    serverAdr = "${Uri.base.host}:${Uri.base.port}";
  }
}
