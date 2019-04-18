
Pod::Spec.new do |spec|

  spec.name         = "BBLogWindow"
  spec.version      = "1.0"
  spec.summary      = "A short description of BBLogWindow."
  spec.description  = <<-DESC
			第一次使用
                   DESC

  spec.homepage     = "https://github.com/LoveSVN/BBLogWindow.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "LoveSVN" => "408477779@qq.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/LoveSVN/BBLogWindow.git", :tag => "#{spec.version}" }

  spec.source_files  = "*/*.{h,m}"
  spec.public_header_files = 'Controller/BBLogTool.h'
  spec.framework  = "UIKit"
  spec.requires_arc = true
  spec.dependency "Masonry"
  spec.dependency "ReactiveObjC"
  spec.dependency "UITableView+FDTemplateLayoutCell"

end
