# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'Runner' do
 use_frameworks!

 # Pods for Runner

 # Flutter Pods
 flutter_application_path = '../ia-final-project-front'
 load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

 install_all_flutter_pods(flutter_application_path)
end

post_install do |installer|
 installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
 end
end