$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dashboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dashboard"
  s.version     = Dashboard::VERSION
  s.authors     = ["vyshnevska"]
  s.email       = ["vyshnevska.n@gmail.com"]
  s.summary     = "Summary of Dashboard."
  s.description = "Description of Dashboard."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
