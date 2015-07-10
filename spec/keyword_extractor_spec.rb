# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
include KeywordExtractorAnalyzer

describe KeywordExtractor do
  context 'uninitialize' do
    describe '#initialize' do
      context 'when call' do
        it 'CountAnalyzer' do
          extractor = KeywordExtractor.new
          analyzer  = extractor.instance_eval('@analyzer')
          analyzer.instance_of?(CountAnalyzer).should be_truthy
        end
      end
    end
  end

  context 'initialized' do
    before(:each) do
      @extractor = KeywordExtractor.new
    end

    describe '#to_count' do
      context 'when call' do
        it 'CountAnalyzer' do
          @extractor.to_count
          analyzer = @extractor.instance_eval('@analyzer')
          analyzer.instance_of?(CountAnalyzer).should be_truthy
        end
      end
    end

    describe '#to_tf_idf' do
      context 'when corpus input' do
        it 'TfIdfAnalyzer' do
          corpus = ['test corpus1', 'test corpus2']
          @extractor.to_tf_idf(corpus)
          analyzer = @extractor.instance_eval('@analyzer')
          analyzer.instance_of?(TfIdfAnalyzer).should be_truthy
        end
      end
    end

    describe '#analyze' do
      context 'when doc input' do
        it 'call analyzer#get_keyword_list' do
          doc = 'test doc 01'
          analyzer = double('analyzer')
          analyzer.should_receive(:get_keyword_list).with(doc)

          @extractor.instance_variable_set('@analyzer', analyzer)
          @extractor.analyze(doc)
        end
      end
    end
  end
end
