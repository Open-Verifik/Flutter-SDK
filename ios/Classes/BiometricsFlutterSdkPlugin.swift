import Flutter
import UIKit
import VerifikKit

@objcMembers public class BiometricsFlutterSdkPlugin: UIViewController, FlutterPlugin, VerifikProtocol {
    var verifik: Verifik?
    var initVerifik = false

    public override func viewDidLoad() {
        super.viewDidLoad()
        print("xxxx")
     }

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "biometrics_flutter_sdk", binaryMessenger: registrar.messenger())
        let instance = BiometricsFlutterSdkPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            case "init":
                if !initVerifik{
                    let vc = UIApplication.shared.windows.first?.rootViewController
                           
                    verifik = Verifik(vc: vc!, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGllbnRJZCI6IjYxNTc3MTU2OTBmMDEwOGNmMmRjNjI4MSIsImRvY3VtZW50VHlwZSI6IkNDIiwiZG9jdW1lbnROdW1iZXIiOiIxNjM1MzczMzY3NDY3NDMiLCJ2IjoxLCJyb2xlIjoiY2xpZW50IiwiZXhwaXJlc0F0IjoiMjAyMi0xMi0wNCAxOTozNjo1NSIsImlhdCI6MTY2NzU5MDYxNX0.QvyQyTXoQCzXlGGfBs2brK15_9AvoveFWTAgprHvRDc",vp: self)
                    result("Init") 
                }
            case "enroll":
                if initVerifik{
                    verifik?.enroll(externalDataBaseRefID: "refId")
                    result("xxx")
                }
                result("enroll")
            case "authenticate":
                if initVerifik{
                    verifik?.authenticate(externalDataBaseRefID: "refId")
                    result("xxx")
                }
            case "matchIDScan":
                if initVerifik{
                    verifik?.matchIDScan(externalDataBaseRefID: "refId")
                    result("xxx")
                }
            case "photoIDScan":
                if initVerifik{
                    verifik?.photoIDScan()
                    result("xxx")
                }
            case "appLoginKYC":
                if initVerifik{
                    verifik?.appRegistrationKYC(project: "63c5620874ed501af5f983b1", email: nil, phone: "")
                    result("xxx")
                }
            default:
                result("not found")
        }
    }

    @objc public func initVerifikSuccess() {
        initVerifik = true
        print("Se inició correctamente el sdk de Verifik")
    }

    @objc public func configError(error: String) {
        print("Hay un error con el sdk de Verifik: \(error)")
    }

    @objc public func sessionError(error: String) {
        print("Hay un error con la sesión de Verifik: \(error)")
    }

    @objc public func onVerifikComplete() {}

    @objc public func onEnrollmentDone(done: Bool) {
        if done{
            print("Se registro el rostro correctamente")
        }
    }

    @objc public func enrollmentError(error: String) {
        print("Hubo un error al registrar el rostro: \(error)")
    }

    @objc public func onAuthDone(done: Bool) {
        if done{
            print("Se autenticó el rostro correctamente")
        }
    }

    @objc public func authError(error: String) {
        print("Hubo un error al autenticar el rostro: \(error)")
    }

    @objc public func onPhotoIDMatchDone(done: Bool) {
        if done{
            print("Se registro correctamente el rostro con la identificación")
        }
    }

    @objc public func photoIDMatchError(error: String) {
        print("Hubo un error al registrar el rostro con la identificación: \(error)")
    }

    @objc public func onPhotoIDScan(done: Bool) {
        if done{
            print("Se escaneo correctamente la identificación")
        }
    }

    @objc public func photoIDScanError(error: String) {
        print("Hubo un error al escanear la identificación")
    }

    @objc public func onAppRegisterDone(done: Bool, resultToken: String?) {
    }

    @objc public func appRegisterError(error: String) {
        print("Hubo un error al intentar hacer el registro en la app: \(error)")
    }

    @objc public func onLivenessDone(done: Bool) {
        print("Hubo un error al intentar hacer onLivenessDone en la app")
    }

    @objc public func livenessError(error: String) {
        print("Hubo un error al intentar hacer livenessError en la app: \(error)")
    }

    @objc public func onAppLoginDone(done: Bool, resultToken: String?) {
        print("Hubo un error al intentar hacer onAppLoginDone en la app")
    }

    @objc public func appLoginError(error: String) {
        print("Hubo un error al intentar hacer appLoginError en la app: \(error)")
    }

    @objc public func onAppPhotoIDScanDone(done: Bool, resultID: String?) {
        print("Hubo un error al intentar hacer onAppPhotoIDScanDone en la app")
    }

    @objc public func appPhotoIDScanError(error: String) {
        print("Hubo un error al intentar hacer appPhotoIDScanError en la app: \(error)")
    }
}