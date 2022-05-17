import 'package:flutter/foundation.dart';

var serverAdr = "vpn.godopu.com:8080";

void init() {
  if (kIsWeb) {
    serverAdr = "${Uri.base.host}:${Uri.base.port}";
  }
}
