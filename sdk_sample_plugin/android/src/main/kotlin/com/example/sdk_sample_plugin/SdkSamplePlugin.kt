package com.example.sdk_sample_plugin

import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.syncfusion.bolddeskmobileSDK.BoldDeskSDK
import com.syncfusion.bolddeskmobileSDK.R

/** SdkSamplePlugin */
class SdkSamplePlugin :
    FlutterPlugin,
    MethodCallHandler {
    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "sdk_sample_plugin")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "showHomeDashboard") {
      BoldDeskSDK.showHomeDashboard(context)
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if(call.method == "showNotification") {
      val messageData = call.argument<Map<String, String>>("body") ?: emptyMap()
      val icon = call.argument<String>("icon") ?: "12"
      val iconResId = resolveIcon(context, icon)
      try {
        BoldDeskSDK.handlePushNotifications(context,messageData,iconResId)
        result.success("Notification shown Successfully")
      } catch (e: Exception) {
        result.error("NOTIFICATION_FAILED", e.message, null)
      }
    } else {
      result.notImplemented()
    }
  }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun resolveIcon(context: Context, iconName: String): Int {
        // Try to resolve from drawable resources
        val resId = context.resources.getIdentifier(
            iconName,
            "drawable",
            context.packageName
        )
        
        // Return resolved ID or default launcher icon
        return if (resId != 0) resId else android.R.drawable.ic_dialog_info
    }
}
