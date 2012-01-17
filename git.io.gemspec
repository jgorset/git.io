# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gitio/version"

Gem::Specification.new do |s|
  s.name        = "git.io"
  s.version     = Gitio::VERSION
  s.authors     = ["Johannes Gorset"]
  s.email       = ["jgorset@gmail.com"]
  s.homepage    = "http://github.com/jgorset/git.io"
  s.summary     = "Command-line client for git.io"
  s.description = "Command-line client for GitHub's URL shortener, git.io."

  s.rubyforge_project = "git.io"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
