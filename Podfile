platform :ios, '9.0'

target 'JLTest' do
  use_frameworks!

  pod 'Firebase'
  pod 'Fabric'
  pod 'Crashlytics'
  pod 'Alamofire', '~> 4.0'
  pod 'SwiftLint'
  pod 'SnapKit', '~> 3.2.0'

  target 'JLTestTests' do
    inherit! :search_paths
    # Pods for testing
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
      end
    end
  end

end
