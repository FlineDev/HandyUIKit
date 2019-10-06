Pod::Spec.new do |s|

  s.name         = "HandyUIKit"
  s.version      = "1.9.1"
  s.summary      = "Handy UI features that should have been part of UIKit in the first place."

  s.description  = <<-DESC
    The goal of this library is to provide handy UI related features that we feel like they should have been
    part of the UIKit frameworks themselves. Therefore this library is intended to inherit solutions for common
    tasks that appear in daily programming and tries to comply to the same naming conventions as already used
    in the Apple frameworks.
                   DESC

  s.homepage     = "https://github.com/Flinesoft/HandyUIKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Cihat Gündüz" => "cocoapods@cihatguenduez.de" }
  s.social_media_url   = "https://twitter.com/Jeehut"

  s.ios.deployment_target = "8.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/Flinesoft/HandyUIKit.git", :tag => "#{s.version}" }
  s.source_files = "Frameworks/HandyUIKit/**/*.swift"
  s.framework    = "UIKit"
  s.swift_version = "4.2"

end
