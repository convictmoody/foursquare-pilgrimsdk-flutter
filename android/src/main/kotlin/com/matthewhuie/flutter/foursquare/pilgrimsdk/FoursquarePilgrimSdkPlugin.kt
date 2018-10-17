package com.matthewhuie.flutter.foursquare.pilgrimsdk

import android.content.Context
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.PluginRegistry.Registrar
import com.foursquare.pilgrim.*
import io.flutter.plugin.common.EventChannel

class FoursquarePilgrimSdkPlugin: MethodCallHandler, EventChannel.StreamHandler {

  companion object {
    private lateinit var registrar: Registrar
    private var eventSink: EventChannel.EventSink? = null

    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val mc = MethodChannel(registrar.messenger(), "foursquare_pilgrimsdk")
      val ec = EventChannel(registrar.messenger(), "foursquare_pilgrimsdk_visits")
      mc.setMethodCallHandler(FoursquarePilgrimSdkPlugin())
      ec.setStreamHandler(FoursquarePilgrimSdkPlugin())
      this.registrar = registrar

      PilgrimSdk.with(
              PilgrimSdk.Builder(registrar.context())
                      .consumer("",
                              "")
                      .logLevel(LogLevel.DEBUG)
                      .notificationHandler(object : PilgrimNotificationHandler() {
                        override fun handleVisit(c: Context, psvn: PilgrimSdkVisitNotification) {
                          // Send visit to EventSink
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
        "clearAllData" -> {
          PilgrimSdk.clearAllData(registrar.context())
        }
        "fireTestVisit" -> {
          PilgrimNotificationTester.fireTestVisit(
                  registrar.context(),
                  Confidence.valueOf(call.argument("confidence")),
                  LocationType.valueOf(call.argument("type")),
                  call.argument("isExit")
          )
        }
        "sendConnectedTestVisit" -> {
          PilgrimNotificationTester.sendConnectedTestVisit(
                  call.argument("venueId"),
                  Confidence.valueOf(call.argument("confidence")),
                  LocationType.valueOf(call.argument("type")),
                  call.argument("isExit")
          )
        }
        "getDebugInfo" -> {
          result.success(PilgrimSdk.getDebugInfo())
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

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    eventSink = events
  }

  override fun onCancel(arguments: Any?) {
    eventSink = null
  }
}
