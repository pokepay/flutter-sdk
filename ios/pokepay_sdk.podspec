#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run 'pod lib lint pokepay_sdk.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'pokepay_sdk'
  s.version          = '1.0.1'
  s.summary          = 'Pokepay flutter SDK'
  s.description      = <<-DESC
Pokepay flutter SDK
                       DESC
  s.homepage         = 'http://pay.pocket-change.jp/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'pokepay developer team' => 'dev@pockepay.jp' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'Pokepay', '2.0.3'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'

end
