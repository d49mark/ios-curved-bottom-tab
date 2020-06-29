Pod::Spec.new do |spec|
  spec.name = "iOS_curve_tab"
  spec.version = "1.0.0"
  spec.summary = "Sample framework from blog post, not for real world use."
  spec.homepage = "https://github.com/"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Dilip" => 'd49web@gmail.com' }
  spec.social_media_url = "http://twitter.com/thoughtbot"

  spec.platform = :ios, "13.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/d49mark/ios-curved-bottom-tab.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "iOS_curve_tab/**/*.{h,swift}"
end