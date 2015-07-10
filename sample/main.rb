# coding: utf-8
require 'keyword_extractor'

def print(mode, extractor, doc)
  header = "--- #{mode} ---"
  footer = '-' * header.length

  puts header
  p extractor.analyze(doc)
  puts footer, ''
end

corpus = ['メロンとスイカです。',
          'メロンとバナナです。']
doc    = 'メロンとパイナップルです。'

keyword_extractor = KeywordExtractor.new

# count mode
keyword_extractor.to_count
print('count mode', keyword_extractor, doc)

# tf_idf mode
keyword_extractor.to_tf_idf(corpus)
print('tf_idf mode', keyword_extractor, doc)
