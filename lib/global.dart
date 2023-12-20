import 'package:flutter/material.dart';
import 'package:login_and_signup/common/services/storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class Global {
  static late StorageServices storageServices;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    storageServices = await StorageServices().init();
  }
}
