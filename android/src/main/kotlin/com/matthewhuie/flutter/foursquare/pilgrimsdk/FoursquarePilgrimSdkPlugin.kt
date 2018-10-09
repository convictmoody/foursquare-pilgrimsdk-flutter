package com.matthewhuie.flutter.foursquare.pilgrimsdk

import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.PluginRegistry.Registrar

class FoursquarePilgrimSdkPlugin(): MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar): Unit {
      val channel = MethodChannel(registrar.messenger(), "foursquare_pilgrimsdk")
      channel.setMethodCallHandler(FoursquarePilgrimSdkPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result): Unit {
    result.notImplemented()
  }
}
