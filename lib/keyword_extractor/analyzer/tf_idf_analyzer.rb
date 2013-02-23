# coding: utf-8
require 'keyword_extractor/analyzer/base_analyzer'
require 'keyword_extractor/analyzer/id_generator'
require 'tf_idf_engine'

module KeywordExtractorAnalyzer
    class TfIdfAnalyzer < BaseAnalyzer
       
        INVALID_CORPUS_ERROR = 'invalid corpus is inputted'

        public
        def initialize(corpus)
            super()
            raise INVALID_CORPUS_ERROR if is_invalid?(corpus)
            @engine = train_engine(corpus)
        end

        protected
        def analyze(doc)
            @engine.analyze(@word_extractor.analyze(doc))
        end

        private
        def is_invalid?(corpus)
            corpus.nil? || corpus.empty? || !corpus.instance_of?(Array)
        end
        
        def train_engine(corpus)
            id_generator = IdGenerator.new('id_%d')
            corpus.inject(TfIdfEngine.new) { |engine, doc|
                raise NIL_DOC_ERROR if nil_or_empty?(doc)
                engine.input(id_generator.next, @word_extractor.analyze(doc))
                engine
            }
        end
    end
end
