Pod::Spec.new do |s|
  s.name         = "Cent"
  s.version      = "5.0.3"
  s.summary      = "Extension for common object types for Swift Language"
  s.homepage     = "https://github.com/ankurp/Cent"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Ankur Patel" => "ankur.patel@ymail.com" }
  s.source       = { :git => "https://github.com/ankurp/Cent.git", :tag => "#{s.version}" }
  s.source_files = "Sources/*.{h,swift}"
  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.dependency "Dollar", "~> 5.2.0"
end
