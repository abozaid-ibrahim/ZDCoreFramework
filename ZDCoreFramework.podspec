#
# Be sure to run `pod lib lint ZDCoreFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZDCoreFramework'
  s.version          = '0.0.2'
  s.summary          = 'ZDCoreFramework makes your code life easier with one develop style.'
  s.description      = 'ZDCoreframework contains a set of extensions & Base classes that you should follow in your app development '

  s.homepage         = 'https://github.com/abuzeid-ibrahim/ZDCoreFramework/wiki'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'abuzeid-ibrahim' => 'abuzeid7@gmail.com' }
  s.source           = { :git => 'https://github.com/abuzeid-ibrahim/ZDCoreFramework.git', :tag => s.version.to_s }
   s.social_media_url = 'https://twitter.com/abuzeid_ibrahim'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZDCoreFramework/Classes/*'

end
