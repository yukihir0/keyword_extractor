# coding: utf-8
require File.expand_path('spec/spec_helper')
include KeywordExtractorAnalyzer

describe TfIdfAnalyzer do
  context 'uninitalizd' do
    describe '#initialize' do
      context 'when nil corpus input' do
        it 'raise error' do
          expect { TfIdfAnalyzer.new(nil)
          }.to raise_error(RuntimeError, TfIdfAnalyzer::INVALID_CORPUS_ERROR)
        end
      end

      context 'when empty corpus input' do
        it 'raise error' do
          expect { TfIdfAnalyzer.new('')
          }.to raise_error(RuntimeError, TfIdfAnalyzer::INVALID_CORPUS_ERROR)
        end
      end

      context 'when invalid corpus input' do
        it 'raise error' do
          expect { TfIdfAnalyzer.new('not array input')
          }.to raise_error(RuntimeError, TfIdfAnalyzer::INVALID_CORPUS_ERROR)
        end
      end

      context 'when corpus input' do
        it 'TfIdfEngine' do
          id1        = 'id_1'
          id2        = 'id_2'
          noun_list1 = ['corpus'] 
          noun_list2 = ['corpus'] 
          corpus     = ['test corpus first', 'test corpus second']

          expected_engine = TfIdfEngine.new
          expected_engine.input(id1, noun_list1)
          expected_engine.input(id2, noun_list2)
          expected_t_o = expected_engine.instance_eval('@t_o') 

          analyzer = TfIdfAnalyzer.new(corpus)
          engine   = analyzer.instance_eval('@engine')
          t_o      = engine.instance_eval('@t_o')
          t_o.should == expected_t_o
        end
      end
    end
  end

  context 'initialized' do
    before(:each) do
      corpus    = ['test corpus 01', 'test corpus 02']
      @analyzer = TfIdfAnalyzer.new(corpus)
    end

    describe '#analyze' do
      context 'when doc input' do
        it 'engine#analyze call' do
          doc       = 'test doc 01'
          noun_list = ['test', 'doc', '01']

          word_extractor = double('word_extractor')
          word_extractor.should_receive(:analyze).with(doc).and_return(noun_list)
          engine = double('engine')
          engine.should_receive(:analyze).with(noun_list)

          @analyzer.instance_variable_set('@word_extractor', word_extractor)
          @analyzer.instance_variable_set('@engine', engine)
          @analyzer.send(:analyze, doc)
        end
      end
    end
  end
end
