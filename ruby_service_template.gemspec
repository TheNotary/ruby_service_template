# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ruby_service_template/version"

Gem::Specification.new do |s|
  s.name        = "ruby_service_template"
  s.version     = RubyServiceTemplate::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["TheNotary"]
  s.email       = ["no@email.plz"]
  s.homepage    = ""
  s.summary     = %q{ This gem is used as a template to make it easier to rapidly develop a system daemon (even on windows!) }
  s.description = %q{ I can't describe it yet...  }

  s.rubyforge_project = "ipfixer_client"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'thor'
  s.add_dependency 'win32-service' if RUBY_PLATFORM =~ /mingw32/
  s.add_development_dependency 'win32console' if RUBY_PLATFORM =~ /mingw32/
  
  s.add_dependency 'daemons' if RUBY_PLATFORM =~ /linux/
  
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'debugger' if RUBY_PLATFORM =~ /linux/
  s.add_development_dependency 'guard-rspec'
end
