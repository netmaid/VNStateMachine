Pod::Spec.new do |s|
  s.name             = "VNStateMachine"
  s.version          = "0.1.5"
  s.summary          = "An Object-based State Machine for Objective-C."
  s.description      = <<-DESC
                         The object-based state is usable for complicated state machine,
                          moreover message dispatcher is important to make simple state
                          management in state machine.
                       DESC

  s.homepage         = "https://github.com/netmaid/VNStateMachine"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = "Chungmin Ahn"
  s.source           = { :git => "https://github.com/netmaid/VNStateMachine.git", :tag => "v#{s.version}" }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'VNStateMachine/**/*.{h,m,mm}'
  s.public_header_files = 'VNStateMachine/**/*.h'
end
