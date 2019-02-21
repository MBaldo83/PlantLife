platform :ios, '12.1'

plugin 'cocoapods-rome', { 
	:pre_compile => Proc.new { |installer|
    	installer.pods_project.targets.each do |target|
        	target.build_configurations.each do |config|
            	config.build_settings['SWIFT_VERSION'] = '4.2'
	        end
    	end
	    installer.pods_project.save
	},
    dsym: false,
    configuration: 'Release'
}


def testing_pods
  pod 'SnapshotTesting', '~> 1.2'
end

target 'PlantLife' do
  use_frameworks!

  testing_pods

end
