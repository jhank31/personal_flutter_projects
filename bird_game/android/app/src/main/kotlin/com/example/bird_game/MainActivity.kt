package com.example.bird_game

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Intent
import android.content.pm.PackageManager

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "com.example.bird_game/openThirdPartyApp"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "openThirdPartyApp") {
                val arguments = call.arguments<Map<String, String>>()
                val packageName = arguments?.get("packagename")
                if (packageName != null) {
                    openThirdPartyApp(packageName, result)
                } else {
                    result.error("INVALID", "Invalid package name", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun openThirdPartyApp(packageName: String, result: MethodChannel.Result) {
        val manager: PackageManager = packageManager
        try {
            val intent = manager.getLaunchIntentForPackage(packageName)
            if (intent == null) throw PackageManager.NameNotFoundException()
            intent.addCategory(Intent.CATEGORY_LAUNCHER)
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
            startActivity(intent)
            result.success(true) 
        } catch (e: PackageManager.NameNotFoundException) {
            result.error("ERROR", "No se pudo abrir la aplicación: ${e.message}", packageName)    }
    }
}
