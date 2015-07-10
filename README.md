# KeywordExtractor [![Build Status](https://travis-ci.org/yukihir0/keyword_extractor.svg?branch=master)](https://travis-ci.org/yukihir0/keyword_extractor)

'keyword_extractor' provides feature for extracting keyword from document.

## Requirements

- ruby >= 2.0
- [noun_extractor](https://github.com/yukihir0/noun_extractor)
- [tf_idf_engine](https://github.com/yukihir0/tf_idf_engine)

## Install

Add this line to your application's Gemfile:

 ```
gem 'keyword_extractor', :github => 'yukihir0/keyword_extractor'
```

And then execute:

```
% bundle install
```

## How to use

```
doc = 'this is a test document'
extractor = KeywordExtractor.new

keyword_list = extractor.analyze(doc)
p keyword_list
```

For more information, please see [here](https://github.com/yukihir0/keyword_extractor/blob/master/sample/main.rb).

## License

Copyright &copy; 2013 yukihir0
