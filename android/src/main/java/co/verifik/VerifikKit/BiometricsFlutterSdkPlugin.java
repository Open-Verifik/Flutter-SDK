package co.verifik.VerifikKit;

import java.util.UUID;

import android.util.Log;
import androidx.annotation.NonNull;
import android.app.Activity;
import android.widget.Toast;
import android.content.Context;
import androidx.lifecycle.Lifecycle;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.embedding.engine.plugins.lifecycle.FlutterLifecycleAdapter;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import co.mat.verifikkit.Verifik;
import co.mat.verifikkit.VerifikCallback;

public class BiometricsFlutterSdkPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware, VerifikCallback {
  private MethodChannel channel;
  private Context context;
  private Lifecycle lifecycle;
  private Activity activity;
  private Verifik verifik;
  private Boolean initVerifik = false;
  private String refId = "VerifikSample" + UUID.randomUUID().toString();
  private String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGllbnRJZCI6IjYxNTc3MTU2OTBmMDEwOGNmMmRjNjI4MSIsImRvY3VtZW50VHlwZSI6IkNDIiwiZG9jdW1lbnROdW1iZXIiOiIxNjM1MzczMzY3NDY3NDMiLCJ2IjoxLCJyb2xlIjoiY2xpZW50IiwiZXhwaXJlc0F0IjoiMjAyMi0xMi0wNCAxOTozNjo1NSIsImlhdCI6MTY2NzU5MDYxNX0.QvyQyTXoQCzXlGGfBs2brK15_9AvoveFWTAgprHvRDc";

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "biometrics_flutter_sdk");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("enroll")) {
      if (initVerifik) {
        verifik.enroll(refId);
      }
    } else if (call.method.equals("authenticate")) {
      if (initVerifik) {
        verifik.authenticate(refId);
      }
    } else if (call.method.equals("matchIDScan")) {
      if (initVerifik) {
        verifik.matchIDScan(refId);
      }
    } else if (call.method.equals("photoIDScan")) {
      if (initVerifik) {
        verifik.photoIDScan();
      }
    } else if (call.method.equals("appLoginKYC")) {
      if (initVerifik) {
        verifik.appLoginKYC("63c5620874ed501af5f983b1", "", "5514968760");
      }
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding binding) {
    lifecycle = FlutterLifecycleAdapter.getActivityLifecycle(binding);
    activity = binding.getActivity();
    verifik = new Verifik(activity, token, this);
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
  }

  @Override
  public void onReattachedToActivityForConfigChanges(
      ActivityPluginBinding binding) {
  }

  @Override
  public void onDetachedFromActivity() {
  }

  @Override
  public void initializationSuccesful() {
    initVerifik = true;
  }

  @Override
  public void appRegisterSuccessful(String token) {
  }

  @Override
  public void appLoginSuccessful(String token) {
  }

  @Override
  public void configError(String error) {
  }

  @Override
  public void sessionError(String error) {
  }

  @Override
  public void enrollmentError(String error) {
  }

  @Override
  public void authError(String error) {
  }

  @Override
  public void photoIDMatchError(String error) {
  }

  @Override
  public void photoIDScanError(String error) {
  }

  @Override
  public void appRegisterError(String error) {
  }

  @Override
  public void appLoginError(String error) {
  }

  @Override
  public void appPhotoIDScanError(String error) {
  }

  @Override
  public void appPhotoIDScanSuccessful(String error) {
  }
}
