# coding: utf-8
require File.expand_path('spec/spec_helper')
include KeywordExtractorAnalyzer

describe IdGenerator do
    context 'uninitialized' do
        describe '#initialize' do
            context 'when id_format input' do
                it 'id_format' do
                    format       = 'id_%03d'
                    id_generator = IdGenerator.new(format)
                    
                    id_format        = id_generator.instance_eval('@id_format')
                    seaquence_number = id_generator.instance_eval('@seaquence_number')

                    id_format.should        == format
                    seaquence_number.should == 0
                end
            end
        end
    end

    context 'initialized' do
        before(:each) do
            id_format     = 'id_%03d'
            @id_generator = IdGenerator.new(id_format)
        end

        describe '#next' do
            context 'when call' do
                it 'expected id' do
                    expected_id1 = 'id_001'
                    expected_id2 = 'id_002'

                    id1 = @id_generator.next
                    id2 = @id_generator.next

                    id1.should == expected_id1
                    id2.should == expected_id2
                end
            end
        end
    end
end
