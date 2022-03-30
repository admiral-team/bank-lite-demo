package com.example.bank_lite

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("d9ad2266-b0c7-4751-be0a-3481205bafb3")
        super.configureFlutterEngine(flutterEngine)
    }
}
