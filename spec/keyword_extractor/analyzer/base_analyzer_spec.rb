# coding: utf-8
require File.expand_path('spec/spec_helper')
include KeywordExtractorAnalyzer

describe BaseAnalyzer do
    context 'uninitialized' do
        describe '#initialize' do
            it 'when call' do
                analyzer       = BaseAnalyzer.new
                word_extractor = analyzer.instance_eval('@word_extractor')
                word_extractor.instance_of?(NounExtractor).should be_truthy
            end
        end
    end

    context 'initialized' do
        before(:each) do
            @analyzer = BaseAnalyzer.new
        end

        describe '#get_keyword_list' do
            context 'when nil doc input' do
                it 'raise error' do
                    expect { @analyzer.get_keyword_list(nil)
                    }.to raise_error(RuntimeError, BaseAnalyzer::NIL_OR_EMPTY_DOC_ERROR)
                end
            end

            context 'when empty doc input' do
                it 'raise error' do
                    expect { @analyzer.get_keyword_list('')
                    }.to raise_error(RuntimeError, BaseAnalyzer::NIL_OR_EMPTY_DOC_ERROR)
                end
            end

            context 'when doc input' do
                it 'call analyzer#analyze' do
                    doc          = 'test doc 01'
                    keyword_list = [['test', 1], ['doc', 1]]
                    @analyzer.should_receive(:analyze).with(doc).and_return(keyword_list)
                    @analyzer.get_keyword_list(doc)
                end
            end
        end

        describe '#analyze' do
            context 'when nil doc input' do
                it 'raise error' do
                    expect { @analyzer.send(:analyze, nil)
                    }.to raise_error(RuntimeError, BaseAnalyzer::NOT_OVERRIDE_ERROR)
                end
            end

            context 'when empty doc input' do
                it 'raise error' do
                    expect { @analyzer.send(:analyze, '')
                    }.to raise_error(RuntimeError, BaseAnalyzer::NOT_OVERRIDE_ERROR)
                end
            end

            context 'when doc input' do
                it 'raise error' do
                    doc = 'test doc 01'
                    expect { @analyzer.send(:analyze, doc)
                    }.to raise_error(RuntimeError, BaseAnalyzer::NOT_OVERRIDE_ERROR)
                end
            end
        end
    end
end
