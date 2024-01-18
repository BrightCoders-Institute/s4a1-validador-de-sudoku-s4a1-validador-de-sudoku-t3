require_relative '../src/board.rb'

RSpec.describe Board do
    describe '#initialize' do
        it 'the code create the matrix 9x9' do
            rows = 9
            cols = 9
            instance = Board.new(rows, cols)

            expect(instance.instance_variable_get(:@dimension)).to be_a(Matrix)
            expect(instance.instance_variable_get(:@dimension).row_count).to eq(rows)
            expect(instance.instance_variable_get(:@dimension).column_count).to eq(cols)

            expect(instance.instance_variable_get(:@dimension).to_a.flatten.all?{|element| element == ' '}).to be true
        end
    end
end