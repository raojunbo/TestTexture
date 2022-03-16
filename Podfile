# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TestTexture' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TestTexture
  pod 'Texture', '~> 3.1.0'
  pod "AFNetworking", "~> 2.0"
  
  pod 'DoraemonKit/Core', '3.0.7', :configurations => ['Debug']
  pod 'DoraemonKit/WithLogger', '3.0.7', :configurations => ['Debug']
  pod 'DoraemonKit/WithGPS', '3.0.7', :configurations => ['Debug']
  pod 'DoraemonKit/WithLoad', '3.0.7', :configurations => ['Debug']
  pod 'DoraemonKit/WithMLeaksFinder', '3.0.7', :configurations => ['Debug']
  
end
post_install do |installer|
    ## Fix DoKit for XCode 12.5
    find_and_replace("Pods/FBRetainCycleDetector/FBRetainCycleDetector/Layout/Classes/FBClassStrongLayout.mm","layoutCache[currentClass] = ivars;", "layoutCache[(id<NSCopying>)currentClass] = ivars;")
end

## Fix DoKit for XCode 12.5
def find_and_replace(dir, findstr, replacestr)
  Dir[dir].each do |name|
      text = File.read(name)
      replace = text.gsub(findstr,replacestr)
      if text != replace
          puts "Fix: " + name
          File.open(name, "w") { |file| file.puts replace }
          STDOUT.flush
      end
  end
  Dir[dir + '*/'].each(&method(:find_and_replace))
end
