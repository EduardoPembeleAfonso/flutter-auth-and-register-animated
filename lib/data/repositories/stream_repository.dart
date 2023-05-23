import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const FlutterSecureStorage storage =  FlutterSecureStorage();
 Stream<void> getToken() async* {
    await storage.read(key: 'token');
  }

