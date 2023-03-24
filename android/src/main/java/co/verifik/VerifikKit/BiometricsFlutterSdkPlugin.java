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
import co.mat.verifikkit.VerifikDocType;

public class BiometricsFlutterSdkPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware, VerifikCallback {
  private MethodChannel channel;
  private Context context;
  private Lifecycle lifecycle;
  private Activity activity;
  private Verifik verifik;
  private Boolean initVerifik = false;
  private Result globalResult;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "biometrics_flutter_sdk");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("init")) {
      if (!initVerifik) {
        globalResult = result;
        String token = call.argument("token");
        verifik = new Verifik(activity, token, this);
      }
    } else if (call.method.equals("enroll")) {
      if (initVerifik) {
        globalResult = result;
        String refId = call.argument("refId");
        verifik.enroll(refId);
      }
    } else if (call.method.equals("authenticate")) {
      if (initVerifik) {
        globalResult = result;
        String refId = call.argument("refId");
        verifik.authenticate(refId);
      }
    } else if (call.method.equals("matchIDScan")) {
      if (initVerifik) {
        globalResult = result;
        String refId = call.argument("refId");
        verifik.matchIDScan(refId);
      }
    } else if (call.method.equals("photoIDScan")) {
      if (initVerifik) {
        globalResult = result;
        verifik.photoIDScan();
      }
    } else if (call.method.equals("appRegistrationKYC")) {
      if (initVerifik) {
        globalResult = result;
        String phone = call.argument("phone");
        verifik.appRegistrationKYC("63c5620874ed501af5f983b1", "", phone);
      }
    } else if (call.method.equals("appLoginKYC")) {
      if (initVerifik) {
        globalResult = result;
        String phone = call.argument("phone");
        verifik.appLoginKYC("63c5620874ed501af5f983b1", "", phone);
      }
    } else if (call.method.equals("appPhotoIDScanKYC")) {
      if (initVerifik) {
        globalResult = result;
        String documentType = call.argument("documentType");
        verifik.appPhotoIDScanKYC("63c5620874ed501af5f983b1", VerifikDocType.GOVERNMENT_ID);
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
  public void initVerifikSuccess() {
    initVerifik = true;
    if (globalResult != null) {
      globalResult.success("initialized");
    }
  }

  @Override
  public void appRegisterSuccessful(String token) {
    if (globalResult != null) {
      globalResult.success(token);
    }
  }

  @Override
  public void appLoginSuccessful(String token) {
    if (globalResult != null) {
      globalResult.success(token);
    }
  }

  @Override
  public void configError(String error) {
    if (globalResult != null) {
      globalResult.success(error);
    }
  }

  @Override
  public void sessionError(String error) {
    if (globalResult != null) {
      globalResult.success(error);
    }
  }

  @Override
  public void enrollmentError(String error) {
    if (globalResult != null) {
      globalResult.success(error);
    }
  }

  @Override
  public void authError(String error) {
    if (globalResult != null) {
      globalResult.success(error);
    }
  }

  @Override
  public void photoIDMatchError(String error) {
    if (globalResult != null) {
      globalResult.success(error);
    }
  }

  @Override
  public void photoIDScanError(String error) {
    if (globalResult != null) {
      globalResult.success(error);
    }
  }

  @Override
  public void appRegisterError(String error) {
    if (globalResult != null) {
      globalResult.success(error);
    }
  }

  @Override
  public void appLoginError(String error) {
    if (globalResult != null) {
      globalResult.success(error);
    }
  }

  @Override
  public void appPhotoIDScanError(String error) {
    if (globalResult != null) {
      globalResult.success(error);
    }
  }

  @Override
  public void appPhotoIDScanSuccessful(String error) {
    if (globalResult != null) {
      globalResult.success(error);
    }
  }
}
