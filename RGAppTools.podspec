Pod::Spec.new do |s|
  
  s.name         = "RGAppTools"
  
  s.version      = "0.2.17"
  
  s.summary      = "App development support tools by Swift programming language."
  
  s.description  = <<-DESC
  App development support tools by Swift programming language.
  
  * App Commons
  * Extensions
  * RGBuilds
  DESC
  
  # Home Page of GitHUb
  # s.homepage     = "https://github.com/rain2540/RGAppTools"

  # Home Page of Gitee
  s.homepage     = "https://gitee.com/rain2540/RGAppTools"
  
  s.license      = { :type => "MPL-2.0", :file => "LICENSE" }
  
  s.author             = { "rain2540" => "rain2540@foxmail.com" }
  s.social_media_url   = "https://weibo.com/rain2540"
  
  s.swift_version = '5.0', '5.1', '5.2', '5.3', '5.4'
  s.swift_versions = ['5.0', '5.1', '5.2', '5.3', '5.4']
  
  s.ios.deployment_target = "11.0"
  # s.osx.deployment_target = "10.13"
  
  # source of GitHub
  # s.source       = { :git => "https://github.com/rain2540/RGAppTools.git", :tag => s.version }

  # source of Gitee
  s.source       = { :git => "https://gitee.com/rain2540/RGAppTools.git", :tag => s.version }
  
  s.default_subspecs = ['Core', 'AppCommons', 'Extensions', 'Protocols', 'RGBuild']
  
  s.requires_arc = true
  s.frameworks = 'CoreLocation', 'WebKit'
  
  s.subspec 'Core' do |sp|
    sp.source_files  = ["Sources/RGAppTools.h", "Sources/RGAppTools.swift", "Sources/RATError.swift"]
  end
  
  s.subspec 'AppCommons' do |sp|
    sp.source_files = ["Sources/AppCommons/*.swift"]
    sp.dependency 'RGAppTools/Core'
  end
  
  s.subspec 'Extensions' do |sp|
    sp.source_files = ["Sources/Extensions/**/*.swift", "Sources/Extensions/*.swift"]
    sp.dependency 'RGAppTools/Core'
    sp.dependency 'RGAppTools/AppCommons'
  end
  
  s.subspec 'Protocols' do |sp|
    sp.source_files = ["Sources/Protocols/**/*.swift", "Sources/Protocols/*.swift"]
    sp.dependency 'RGAppTools/Core'
    sp.dependency 'RGAppTools/AppCommons'
  end
  
  s.subspec 'RGBuild' do |sp|
    sp.source_files = ["Sources/RGBuild/*.swift"]
    sp.dependency 'RGAppTools/Core'
  end
  
end
