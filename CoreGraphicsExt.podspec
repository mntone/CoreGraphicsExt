Pod::Spec.new do |spec|
	spec.name          = "CoreGraphicsExt"
	spec.version       = "0.9.2"
	spec.summary       = "CoreGraphicsExt"
	spec.description   = "Core Graphics extensions"
	spec.homepage      = "https://github.com/mntone/MTKit"
	spec.license       = "MIT license"
	spec.author        = { "mntone" => "mntone@outlook.jp" }
	spec.source        = { :git => "https://github.com/mntone/CoreGraphicsExt.git", :tag => "#{spec.version}" }
	spec.source_files  = "Sources/**/*.{h,c,m}"

	spec.frameworks                = 'Foundation', 'CoreGraphics', 'ImageIO'

	spec.ios.deployment_target     = '8.0'
	spec.ios.frameworks            = 'MobileCoreServices'

	spec.watchos.deployment_target = '2.0'
	spec.watchos.frameworks        = 'MobileCoreServices'

	spec.tvos.deployment_target    = '9.0'
	spec.tvos.frameworks           = 'MobileCoreServices'

	spec.osx.deployment_target     = '10.9'
	spec.osx.frameworks            = 'CoreServices'
end
