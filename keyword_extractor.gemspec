# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'keyword_extractor/version'

Gem::Specification.new do |gem|
  gem.name          = "keyword_extractor"
  gem.version       = KeywordExtractor::VERSION
  gem.authors       = ["yukihir0"]
  gem.email         = ["yukihiro.cotori@gmail.com"]
  gem.description   = %q{'keyword_extractor' provides feature for extracting keyword from document.}
  gem.summary       = %q{'keyword_extractor' provides feature for extracting keyword from document.}
  gem.homepage      = "https://github.com/yukihir0/keyword_extractor"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'noun_extractor', '~>0.1.5'
  gem.add_dependency 'tf_idf_engine',  '~>0.0.5'
  gem.add_development_dependency "rake", "~>10.4.2"
  gem.add_development_dependency "rspec", "~>3.3.0"
  gem.add_development_dependency "coveralls", "~>0.8.2"
end
