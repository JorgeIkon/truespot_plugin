#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint truespot.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'truespot'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  s.vendored_frameworks = 'TSRTLS.framework'
  #s.dependency 'AFNetworking'
  s.dependency 'SwiftyJSON'
  #s.dependency '  '
  #s.subspec 'TSRTLS' do |ss|
  #  ss.name = 'TSRTLS'
  #  ss.license = 'MIT'
  #  ss.version = '1.0.6'
  #  ss.platform = :ios
  #  ss.source = { :git => 'https://bitbucket.org/stratofuzedev/rtls-sdk-ios.git', :tag => '1.0.6', :submodules => true  }
  #end
      
end
