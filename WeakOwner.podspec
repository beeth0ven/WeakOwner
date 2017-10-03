Pod::Spec.new do |s|
    s.name = "WeakOwner"
    s.version = "0.0.5"
    s.license = { :type => "MIT", :file => "LICENSE" }
    s.summary = "A better way to deal with weak reference function."
    s.homepage = "https://github.com/beeth0ven/WeakOwner"
    s.author = { "Luo Jie" => "beeth0vendev@gmail.com" }
    s.source = { :git => "https://github.com/beeth0ven/WeakOwner.git", :tag => "#{s.version}"}

    s.source_files = "WeakOwner/Sources/*.swift"
    s.requires_arc = true

    s.ios.deployment_target = "8.0"
    s.osx.deployment_target = "10.9"
    s.tvos.deployment_target = "9.0"
    s.watchos.deployment_target = "2.0"
end

#   Pod Specification: https://guides.cocoapods.org/syntax/podspec.html
