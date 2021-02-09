
platform :ios, '11.0'

source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/Asbelita/LoginMVPPodSpecs.git'

target 'MVP-Repository' do
  pod 'LoginMVP'
end

post_install do |pods|
    pods.pods_project.targets.each do |pod|
      pod.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
      end
    end
end
