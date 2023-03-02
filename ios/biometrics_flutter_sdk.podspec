#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint biometrics_flutter_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'biometrics_flutter_sdk'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  # s.user_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  s.preserve_paths = 'VerifikKit.xcframework/**/*', 'FaceTecSDK.framework',
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework VerifikKit -framework FaceTecSDK' }
  s.vendored_frameworks = 'VerifikKit.xcframework', 'FaceTecSDK.framework'
  # s.preserve_paths = 'VerifikKit.xcframework/**/*',
  # s.xcconfig = { 'OTHER_LDFLAGS' => '-framework VerifikKit' }
  # s.vendored_frameworks = 'VerifikKit.xcframework'
  # s.preserve_paths = 'FaceTecSDK.framework',
  # s.xcconfig = { 'OTHER_LDFLAGS' => '-framework FaceTecSDK' }
  # s.vendored_frameworks = 'FaceTecSDK.framework'
end
