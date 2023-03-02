import Flutter
import UIKit
import VerifikKit

public class BiometricsFlutterSdkPlugin: UIViewController, FlutterPlugin {
    var verifik: Verifik?
    var initVerifik = false
    let refId = "verifik_app_" + UUID().uuidString

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "biometrics_flutter_sdk", binaryMessenger: registrar.messenger())
        let instance = BiometricsFlutterSdkPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)

        // let flutterViewController = FlutterViewController(nibName: nil, bundle: nil)
        // FlutterWindow.sharedInstance().run(with: flutterViewController)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            case "init":
                if !initVerifik{
                    verifik = Verifik(vc: self, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGllbnRJZCI6IjYxNTc3MTU2OTBmMDEwOGNmMmRjNjI4MSIsImRvY3VtZW50VHlwZSI6IkNDIiwiZG9jdW1lbnROdW1iZXIiOiIxNjM1MzczMzY3NDY3NDMiLCJ2IjoxLCJyb2xlIjoiY2xpZW50IiwiZXhwaXJlc0F0IjoiMjAyMi0xMi0wNCAxOTozNjo1NSIsImlhdCI6MTY2NzU5MDYxNX0.QvyQyTXoQCzXlGGfBs2brK15_9AvoveFWTAgprHvRDc")
                }
                result("init")
            case "enroll":
                if initVerifik{
                    verifik?.enroll(externalDataBaseRefID: refId)
                }
                result("enroll")
            case "authenticate":
                if initVerifik{
                    verifik?.authenticate(externalDataBaseRefID: refId)
                }
                result("authenticate")

            case "matchIDScan":
                if initVerifik{
                    verifik?.matchIDScan()
                }
                result("matchIDScan")

            case "photoIDScan":
                if initVerifik{
                    verifik?.photoIDScan()
                }
                result("photoIDScan")

            case "appLoginKYC":
                if initVerifik{
                    verifik?.appRegistrationKYC(project: "63c5620874ed501af5f983b1", email: nil, phone: "")
                }
                result("appLoginKYC")
            default:
                result("not found")
        }
    }
}

extension BiometricsFlutterSdkPlugin: VerifikProtocol {
    public func initializationSuccesful() {
        initVerifik = true
        print("Se inició correctamente el sdk de Verifik")
    }

    public func configError(error: String) {
        print("Hay un error con el sdk de Verifik: \(error)")
    }

    public func sessionError(error: String) {
        print("Hay un error con la sesión de Verifik: \(error)")
    }

    public func onVerifikComplete() {}

    public func onEnrollmentDone(done: Bool) {
        if done{
            print("Se registro el rostro correctamente")
        }
    }

    public func enrollmentError(error: String) {
        print("Hubo un error al registrar el rostro: \(error)")
    }

    public func onAuthDone(done: Bool) {
        if done{
            print("Se autenticó el rostro correctamente")
        }
    }

    public func authError(error: String) {
        print("Hubo un error al autenticar el rostro: \(error)")
    }

    public func onPhotoIDMatchDone(done: Bool) {
        if done{
            print("Se registro correctamente el rostro con la identificación")
        }
    }

    public func photoIDMatchError(error: String) {
        print("Hubo un error al registrar el rostro con la identificación: \(error)")
    }

    public func onPhotoIDScan(done: Bool) {
        if done{
            print("Se escaneo correctamente la identificación")
        }
    }

    public func photoIDScanError(error: String) {
        print("Hubo un error al escanear la identificación")
    }

    public func onAppRegisterDone(done: Bool, resultToken: String?) {
        if done{
            let alert = UIAlertController(title: "Login exitoso", message: resultToken, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.show(alert, sender: nil)
        }
    }

    public func appRegisterError(error: String) {
        print("Hubo un error al intentar hacer el registro en la app: \(error)")
    }
}
