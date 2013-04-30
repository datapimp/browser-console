$:.push File.expand_path("../lib", __FILE__)
require 'browser_console/version'

Gem::Specification.new do |s|
  s.name          = "browser_console"
  s.version       = BrowserConsole::Version
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Jonathan Soeder"]
  s.email         = ["jonathan.soeder@gmail.com"]
  s.homepage      = "http://datapimp.github.io/browser_console"
  s.summary       = "provides you with a console in your web browser"
  s.description   = ""

  s.add_dependency  "pry"

  s.add_development_dependency "rspec-rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

end