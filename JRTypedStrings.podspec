Pod::Spec.new do |s|
  s.name             = 'JRTypedStrings'
  s.version          = '1.0.5'
  s.summary          = '`JRTypedString` provides a convenience API that allows you access `UIViewControllers`, `UITableViewCells` etc, in a type-safe way.'

  s.homepage         = 'https://github.com/psartzetakis/JRTypedStrings'
  s.license          = { :type => 'MIT', :file => 'LICENSE.' }
  s.author           = 'Panagiotis Sartzetakis'
  s.source           = { :git => 'https://github.com/psartzetakis/JRTypedStrings.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/SartzetakisP'

  s.source_files = 'Source/*.swift'
  s.platform = :ios, '8.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true
end
