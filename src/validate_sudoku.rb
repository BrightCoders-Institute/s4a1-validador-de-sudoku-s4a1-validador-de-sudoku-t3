# frozen_string_literal: true

# Clase para validar el sudoku
class ValidateSudoku
  def initialize(matrix)
    @matrix = matrix
  end

  def validate_all
    validate_rows && validate_cols && validate_area
  end

  def validate_rows
    @matrix.all? do |row|
      filtered_row = row.reject(&:zero?)
      filtered_row.uniq.size == filtered_row.size
    end
  end

  def validate_cols
    cols = columns
    cols.all? do |col|
      filtered_col = col.reject(&:zero?)
      filtered_col.uniq.size == filtered_col.size
    end
  end

  def validate_area
    areas = extract_areas
    areas.all? do |area|
      filtered_area = area.reject(&:zero?)
      filtered_area.uniq.size == filtered_area.size
    end
  end

  # private

  def columns
    @matrix.transpose
  end

  def extract_areas
    areas = []

    (0..8).step(3) do |row|
      (0..8).step(3) do |col|
        areas << extract_area(row, col)
      end
    end
    areas
  end

  def extract_area(row, col)
    area = []
    (row...row + 3).each do |r|
      (col...col + 3).each do |c|
        area << @matrix[r][c]
      end
    end
    area
  end
end

tablero = [
  [5, 3, 0, 0, 7, 0, 0, 0, 0],
  [6, 0, 0, 1, 9, 5, 0, 0, 0],
  [0, 9, 8, 0, 0, 0, 0, 6, 0],
  [8, 0, 0, 0, 6, 0, 0, 0, 3],
  [4, 0, 0, 8, 0, 3, 0, 0, 1],
  [7, 0, 0, 0, 2, 0, 0, 0, 6],
  [0, 6, 0, 0, 0, 0, 2, 8, 0],
  [0, 0, 0, 4, 1, 9, 0, 0, 5],
  [0, 0, 0, 0, 8, 0, 9, 7, 9] # El último 9 es inválido (repetido)
]

tablero2 = [
  [5, 3, 0, 0, 7, 0, 0, 0, 0],
  [6, 0, 0, 1, 9, 5, 0, 0, 0],
  [0, 9, 8, 0, 0, 0, 0, 6, 0],
  [8, 0, 0, 0, 6, 0, 0, 0, 3],
  [4, 0, 0, 8, 0, 3, 0, 0, 1],
  [7, 0, 0, 0, 2, 0, 0, 0, 6],
  [0, 6, 0, 0, 0, 0, 2, 8, 0],
  [0, 0, 0, 4, 1, 9, 0, 0, 5],
  [0, 0, 0, 0, 8, 0, 0, 7, 9]
] # Debería imprimir: true

validar = ValidateSudoku.new(tablero)
puts '------ TABLERO 1 --------'
puts validar.validate_all
puts validar.validate_area
puts validar.validate_cols
puts validar.validate_rows

puts '------ TABLERO 2 --------'
validar2 = ValidateSudoku.new(tablero2)
puts validar2.validate_all
puts validar2.validate_area
puts validar2.validate_cols
puts validar2.validate_rows
