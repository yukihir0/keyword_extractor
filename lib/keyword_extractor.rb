# coding: utf-8
require 'keyword_extractor/version'
require 'keyword_extractor/analyzer/count_analyzer'
require 'keyword_extractor/analyzer/tf_idf_analyzer'

class KeywordExtractor
  include KeywordExtractorAnalyzer

  public
  def initialize
    to_count
  end

  def to_count
    @analyzer = CountAnalyzer.new
    self
  end

  def to_tf_idf(corpus)
    @analyzer = TfIdfAnalyzer.new(corpus)
    self
  end

  def analyze(doc)
    @analyzer.get_keyword_list(doc)
  end
end
