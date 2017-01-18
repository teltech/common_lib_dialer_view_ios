#
# Be sure to run `pod lib lint TelTechDialerView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TelTechDialerView'
  s.version          = '0.2.0'
  s.summary          = 'A simple drop in to have an in-call UI for voip calls.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This pod creates a simple interface for receiving and placing SIP calls.
It imitates the look and feel of the native iOS dialer.
                       DESC

  s.homepage         = 'https://git.teltech.co/jasonclardy/TelTechDialerView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jason Clardy' => 'jason@teltech.co' }
  s.source           = { :git => 'https://git.teltech.co/jasonclardy/TelTechDialerView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TelTechDialerView/Classes/**/*'

  s.resource_bundles = {
    'TelTechDialerView' => ['TelTechDialerView/Assets/*.{storyboard,xcassets,xib,png}']
  }


  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
