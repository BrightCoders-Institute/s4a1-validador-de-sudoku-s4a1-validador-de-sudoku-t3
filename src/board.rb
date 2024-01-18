# frozen_string_literal: true

require 'matrix'

# Clase para definir el tablero del sudoku
class Board
  attr_accessor :dimension

  def initialize(rows, cols)
    @dimension = Matrix.build(rows, cols) { ' ' }
  end

  def print_board
    @dimension.to_a.each_with_index do |row, index|
      puts row.join('|')
      puts '-----------------' unless index == @dimension.row_count - 1 || (index + 1) % 3 != 0
    end
  end

  def fill_board_with_random_numbers
    (1..9).to_a.shuffle.each do |num|
      fill_section_with_number(num)
    end
  end

  def fill_board_manually
    puts "Enter the Sudoku values row-wise (use '0' for empty cells):"
    @dimension = Matrix.build(@dimension.row_count, @dimension.column_count) { gets.chomp }
  end

  def fill_section_with_number(num)
    3.times do |_i|
      3.times do |_j|
        row = rand(@dimension.row_count)
        col = rand(@dimension.column_count)
        until valid_placement?(row, col, num)
          row = rand(@dimension.row_count)
          col = rand(@dimension.column_count)
        end
        @dimension[row, col] = num
      end
    end
  end

  def valid_placement?(row, col, num)
    !@dimension.row(row).include?(num) && !@dimension.column(col).include?(num) && !section_contains_number?(row,
                                                                                                             col, num)
  end

  def section_contains_number?(row, col, num)
    section_row_start = (row / 3) * 3
    section_col_start = (col / 3) * 3

    3.times do |i|
      3.times do |j|
        return true if @dimension[section_row_start + i, section_col_start + j] == num
      end
    end

    false
  end
end

