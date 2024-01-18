# frozen_string_literal: true

require_relative 'board'
require_relative 'validate_sudoku'

# Clase para inicializar la App
class App
  def initialize
    @board = Board.new(9, 9)
  end
end

app = App.new
app.board.print_board
validator = ValidateSudoku.new(app.board.board)
puts validator.validate_all
