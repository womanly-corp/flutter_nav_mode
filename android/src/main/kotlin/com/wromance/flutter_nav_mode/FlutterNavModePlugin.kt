package com.wromance.flutter_nav_mode

import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin

/** FlutterNavModePlugin */
class FlutterNavModePlugin: FlutterPlugin {
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    context = binding.applicationContext
    NavBarApi.setUp(binding.binaryMessenger, NavBarApiImpl(context))
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    NavBarApi.setUp(binding.binaryMessenger, null)
  }
}

private class NavBarApiImpl(private val context: Context) : NavBarApi {
  override fun getNavBarMode(): NavBarMode {
    val resources = context.resources
    val resId = resources.getIdentifier("config_navBarInteractionMode", "integer", "android")
    
    return when (if (resId > 0) resources.getInteger(resId) else 0) {
      0 -> NavBarMode.THREE_BUTTON
      1 -> NavBarMode.TWO_BUTTON
      2 -> NavBarMode.GESTURE
      else -> NavBarMode.UNKNOWN
    }
  }
}
