# coding: utf-8
require 'keyword_extractor/analyzer/base_analyzer'

module KeywordExtractorAnalyzer
  class CountAnalyzer < BaseAnalyzer

    public
    def initialize
      super()
    end

    protected
    def analyze(doc)
      word_list = @word_extractor.analyze(doc)

      word_list.inject(Hash.new(0)) { |keyword_list, word|
        keyword_list[word] += 1
        keyword_list
      }
    end
  end
end
