package com.example.alarm_app

import android.content.Context
import android.media.RingtoneManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val _channel = "AlarmChannel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) { GeneratedPluginRegistrant.registerWith(flutterEngine)
        val test = Alarm(applicationContext)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, _channel).setMethodCallHandler { call, result ->
            when(call.method) {
                "playAlarm" -> result.success(test.playAlarm())
                "stopAlarm" -> result.success(test.stopAlarm())
                else -> result.notImplemented()
            }
        }
    }
}

class Alarm(applicationContext: Context) {
    // Using ring-tones to get sound in the app for now. Should update later with actual alarm sound.
    // Ideally with the option to select the sound to use and the ability to play through headphones
    private val alarm = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_ALARM)
    private val ringer = RingtoneManager.getRingtone(applicationContext, alarm)

    // Flutter complains if these aren't Strings for some reason.
    fun stopAlarm(): String {
        ringer.stop()
        return "Successfully Stopped Alarm"
    }

    fun playAlarm(): String {
        ringer.play()
        return "Successfully Played Alarm"
    }
}