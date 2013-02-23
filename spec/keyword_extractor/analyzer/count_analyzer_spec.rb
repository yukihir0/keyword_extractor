# coding: utf-8
require File.expand_path('spec/spec_helper')
include KeywordExtractorAnalyzer

describe CountAnalyzer do
    context 'initalized' do
        before(:each)do
            @analyzer = CountAnalyzer.new
        end

        describe '#analyze' do
            context 'when doc input' do
                it 'expected keyword_list' do
                    doc = 'a b c a b a'
                    noun_list = ['a', 'b', 'c', 'a', 'b', 'a']
                    expected = {'a' => 3, 'b' => 2, 'c' => 1}
                    
                    word_extractor = mock('word_extractor')
                    word_extractor.should_receive(:analyze).with(doc).and_return(noun_list)
                    @analyzer.instance_variable_set('@word_extractor', word_extractor)
                    keyword_list = @analyzer.send(:analyze, doc)

                    keyword_list.should == expected
                end
            end
        end
    end
end
