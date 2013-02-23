# coding: utf-8
require 'noun_extractor'

module KeywordExtractorAnalyzer
    class BaseAnalyzer

        NIL_OR_EMPTY_DOC_ERROR = 'nil or empty doc is inputted'
        NOT_OVERRIDE_ERROR     = 'abstract method is called'

        public
        def initialize
            @word_extractor = NounExtractor.new
        end

        def get_keyword_list(doc)
            raise NIL_OR_EMPTY_DOC_ERROR if nil_or_empty?(doc)
            analyze(doc).sort_by{|key, value| -value}
        end

        protected
        def analyze(doc)
            raise NOT_OVERRIDE_ERROR
        end

        def nil_or_empty?(doc)
            doc.nil? || doc.empty?
        end
    end
end
