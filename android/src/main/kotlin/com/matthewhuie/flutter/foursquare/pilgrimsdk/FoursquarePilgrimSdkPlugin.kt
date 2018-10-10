package com.matthewhuie.flutter.foursquare.pilgrimsdk

import android.content.Context
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.PluginRegistry.Registrar
import com.foursquare.pilgrim.*

class FoursquarePilgrimSdkPlugin: MethodCallHandler {

  companion object {
    private lateinit var registrar: Registrar

    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "foursquare_pilgrimsdk")
      channel.setMethodCallHandler(FoursquarePilgrimSdkPlugin())
      this.registrar = registrar

      PilgrimSdk.with(
        PilgrimSdk.Builder(registrar.context())
          .consumer("", "")
          .logLevel(LogLevel.DEBUG)
          .notificationHandler(object : PilgrimNotificationHandler() {
            override fun handleVisit(c: Context, psvn: PilgrimSdkVisitNotification) {
              val venue = psvn.visit.toString()
              android.util.Log.d("foursquare-pilgrimsdk", venue)
            }
          })
      )
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    call.apply {
      when (call.method) {
        "start" -> {
          PilgrimSdk.start(registrar.context())
        }
        "stop" -> {
          PilgrimSdk.stop(registrar.context())
        }
        "fireTestVisit" -> {
          PilgrimNotificationTester.fireTestVisit(registrar.context(), Confidence.HIGH, LocationType.VENUE, false)
        }
        "getInstallId" -> {
          result.success(PilgrimSdk.getInstallId())
        }
        "isEnabled" -> {
          result.success(PilgrimSdk.isEnabled())
        }
        else -> {
          result.notImplemented()
        }
      }
    }
  }
}
