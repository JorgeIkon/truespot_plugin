package com.ikontechnologies.truespot.truespot

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull
import com.example.truespotrtlsandroid.TrueSpot
import com.example.truespotrtlsandroid.TSBeacon

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** TruespotPlugin */
class TruespotPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {

    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private lateinit var activity: Activity


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "truespot")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "configure" -> {
                val args = HashMap<String, Any>()
                args.putAll(call.arguments as Map<out String, Any>)

                val tenantId: String = args["tenantId"] as String
                val clientSecret: String = args["clientSecret"] as String
                val isDebugMode: Boolean = args["isDebugMode"] as Boolean

                result.success("Tenant id: $tenantId \n Client secret: $clientSecret \n Debug mode: $isDebugMode\n")
            }
            "requestLocationPermission" -> TrueSpot.requestLocationPermission(
                context,
                activity,
            )
            "startScanning" -> TrueSpot.startScanning(context, activity)
            "stopScanning" -> TrueSpot.stopScanning(context, activity)
            "observeBeaconRanged" -> TrueSpot.observeBeaconRanged(
                { ts: MutableList<TSBeacon> -> print(ts.size) },
                context,
            )
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    }

    override fun onDetachedFromActivity() {
    }
}


//    private lateinit var lifeCycle: LifecycleOwner

//                val view = activity.layoutInflater.inflate(R.layout.fragment_modar_mode, null).rootView
//                lifeCycle = ViewTreeLifecycleOwner.get(view)!!
//                TrueSpot.configure(
//                    tenantId = tenantId,
//                    clientSecret = clientSecret,
//                    isDebugMode = isDebugMode,
//                    completion = {c -> print(c?.message) },
//                    activity = activity,
//                    context = context,
//                    application = activity.application,
//                    viewLifecycleOwner = lifeCycle,
//                    viewModelStoreOwner = vmso
//                )

//        "launchTruedarMode" -> TrueSpot.launchTruedarMode(ModarModeFragment)

//        "getTrackingDevices" -> TrueSpot.getTrackingDevices()
//        "pair" -> TrueSpot.pair()
//        "unpair" -> TrueSpot.unpair()