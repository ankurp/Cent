Pod::Spec.new do |s|
  s.name         = "Cent"
  s.version      = "6.1.0"
  s.summary      = "Extension for common object types for Swift Language"
  s.homepage     = "https://github.com/ankurp/Cent"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Ankur Patel" => "ankur.patel@ymail.com" }
  s.source       = { :git => "https://github.com/ankurp/Cent.git", :tag => "#{s.version}" }
  s.source_files = "Sources/*.{h,swift}"
  s.requires_arc = true
  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.10"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"
  s.dependency "Dollar", "~> 7.0.0"
end
