package co.verifik.VerifikKit;

import java.util.Map;

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
  private String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGllbnRJZCI6IjYxNTc3MTU2OTBmMDEwOGNmMmRjNjI4MSIsImRvY3VtZW50VHlwZSI6IkNDIiwiZG9jdW1lbnROdW1iZXIiOiIxNjM1MzczMzY3NDY3NDMiLCJ2IjoxLCJyb2xlIjoiY2xpZW50IiwiZXhwaXJlc0F0IjoiMjAyMi0xMi0wNCAxOTozNjo1NSIsImlhdCI6MTY2NzU5MDYxNX0.QvyQyTXoQCzXlGGfBs2brK15_9AvoveFWTAgprHvRDc";
  private Result globalResult;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "biometrics_flutter_sdk");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("init")) {
      result.success("Init");
    } else if (call.method.equals("enroll")) {
      if (initVerifik) {
        String refId = call.argument("refId");
        globalResult = result;
        verifik.enroll(refId);
      }
    } else if (call.method.equals("authenticate")) {
      if (initVerifik) {
        String refId = call.argument("refId");
        globalResult = result;
        verifik.authenticate(refId);
      }
    } else if (call.method.equals("matchIDScan")) {
      if (initVerifik) {
        String refId = call.argument("refId");
        globalResult = result;
        verifik.matchIDScan(refId);
      }
    } else if (call.method.equals("photoIDScan")) {
      if (initVerifik) {
        globalResult = result;
        verifik.photoIDScan();
      }
    } else if (call.method.equals("appLoginKYC")) {
      if (initVerifik) {
        globalResult = result;
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
    if(globalResult != null){
      globalResult.success(token);
    }
  }

  @Override
  public void appLoginSuccessful(String token) {
    if(globalResult != null){
      globalResult.success(token);
    }
  }

  @Override
  public void configError(String error) {
    if(globalResult != null){
      globalResult.success(error);
    }
  }

  @Override
  public void sessionError(String error) {
    if(globalResult != null){
      globalResult.success(error);
    }
  }

  @Override
  public void enrollmentError(String error) {
    if(globalResult != null){
      globalResult.success(error);
    }
  }

  @Override
  public void authError(String error) {
    if(globalResult != null){
      globalResult.success(error);
    }
  }

  @Override
  public void photoIDMatchError(String error) {
    if(globalResult != null){
      globalResult.success(error);
    }
  }

  @Override
  public void photoIDScanError(String error) {
    if(globalResult != null){
      globalResult.success(error);
    }
  }

  @Override
  public void appRegisterError(String error) {
    if(globalResult != null){
      globalResult.success(error);
    }
  }

  @Override
  public void appLoginError(String error) {
    if(globalResult != null){
      globalResult.success(error);
    }
  }

  @Override
  public void appPhotoIDScanError(String error) {
    if(globalResult != null){
      globalResult.success(error);
    }
  }

  @Override
  public void appPhotoIDScanSuccessful(String error) {
    if(globalResult != null){
      globalResult.success(error);
    }
  }
}
