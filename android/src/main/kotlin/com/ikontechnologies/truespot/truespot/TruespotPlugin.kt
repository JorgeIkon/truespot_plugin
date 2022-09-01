package com.ikontechnologies.truespot.truespot

import android.app.Activity
import androidx.appcompat.app.AppCompatActivity;
import android.content.Context
import androidx.annotation.NonNull
import androidx.lifecycle.*
import com.example.truespotrtlsandroid.TSBeacon
import com.example.truespotrtlsandroid.TrueSpot
import com.example.truespotrtlsandroid.BeaconServiceViewModel

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** TruespotPlugin */
class TruespotPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {

    private lateinit var viewModelStoreOwner: ViewModelStoreOwner
    private lateinit var lifecycleOwner: LifecycleOwner
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
                try {
                    lifecycleOwner = activity as LifecycleOwner
                    viewModelStoreOwner = ViewTreeViewModelStoreOwner.get(activity.window.decorView)!!
                } catch (e: Exception) {
                    print(e)
                }

                val args = HashMap<String, Any>()
                args.putAll(call.arguments)

                val tenantId: String = args["tenantId"] as String
                val clientSecret: String = args["clientSecret"] as String
                val isDebugMode: Boolean = args["isDebugMode"] as Boolean

                TrueSpot.configure(
                    context = context,
                    activity = activity,
                    tenantId = tenantId,
                    isDebugMode = isDebugMode,
                    clientSecret = clientSecret,
                    application = activity.application,
                    viewLifecycleOwner = lifecycleOwner,
                    viewModelStoreOwner =  viewModelStoreOwner,
                    completion = {c -> result.success("message: ${c?.message}\n stackTrace: ${c?.stackTrace}") },
                )
            }
            "requestLocationPermission" -> TrueSpot.requestLocationPermission(
                context,
                activity,
            )
            "startScanning" -> TrueSpot.startScanning(context, activity)
            "stopScanning" -> TrueSpot.stopScanning(context, activity)
//            "launchTruedarMode" -> TrueSpot.launchTruedarMode(supportFragmentManager = fragment)
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

private fun <K, V> java.util.HashMap<K, V>.putAll(from: V) {


}

//        val viewGroup = activity.findViewById(android.R.id.content) as ViewGroup?
//        view = activity.layoutInflater.inflate(R.layout.fragment_modar_mode, viewGroup).rootView

//        "getTrackingDevices" -> TrueSpot.getTrackingDevices()
//        "pair" -> TrueSpot.pair()
//        "unpair" -> TrueSpot.unpair()