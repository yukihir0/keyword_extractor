# coding: utf-8

module KeywordExtractorAnalyzer
  class IdGenerator
    def initialize(id_format)
      @id_format = id_format
      @seaquence_number = 0
    end

    def next
      @seaquence_number += 1
      format(@id_format, @seaquence_number)
    end
  end
end
