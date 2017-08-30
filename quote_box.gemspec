# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "quote_box/version"

Gem::Specification.new do |spec|
  spec.name          = "quote_box"
  spec.version       =  QuoteBox::VERSION

  spec.authors       = ["Haroon Azhar Khan Niazi"]
  spec.email         = ["haroon1azhar@gmail.com"]

  spec.summary       = "Retrives qoutes.Provides a cli interface to look for information"
 
  spec.homepage      = "https://github.com/HaroonAzhar/quote-box-cli-app"
  spec.license       = "MIT"


  

  spec.files  = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "nokogiri" 
  
  

end
