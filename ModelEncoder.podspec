#
# Be sure to run `pod lib lint ModelEncoder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name                    = 'ModelEncoder'
  s.version                 = '1.0.0'
  s.summary                 = 'A JSON deserialization library for Swift.'
#  s.description             = <<-DESC
#                                 DESC
  s.homepage                = 'https://github.com/victor-pavlychko/Encoder'
  s.license                 = { :type => 'MIT', :file => 'LICENSE' }
  s.author                  = { 'Victor Pavlychko' => 'victor.pavlychko@gmail.com' }
  s.source                  = { :git => 'https://github.com/victor-pavlychko/Encoder.git', :tag => s.version.to_s }
  s.social_media_url        = 'https://twitter.com/victorpavlychko'
  s.ios.deployment_target   = '9.0'
  s.source_files            = 'Encoder/**/*'
  s.module_name             = 'Encoder'
end
