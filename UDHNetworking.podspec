Pod::Spec.new do |s|
  s.name                  = "UDHNetworking"
  s.version               = "0.1.0"
  s.summary               = "iot网络库"
  s.homepage              = "https://www.aliyun.com/"
  s.license               = { :type => 'Copyright', :text => "Alibaba-INC copyright" }
  s.author                = { "hcy" => "317727215@qq.com" }
  s.source                = { :git => "https://github.com/DanteCY/UDHNetworking.git" }
  s.platform              = :ios, '8.0'
  s.vendored_frameworks = 'UDHNetworking/UDHNetworking.framework'
  s.frameworks = 'Foundation','CoreGraphics'
  s.requires_arc = true
  s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}