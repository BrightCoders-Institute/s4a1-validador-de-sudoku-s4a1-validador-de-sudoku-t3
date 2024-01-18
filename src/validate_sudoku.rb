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
      filtered(row)
    end
  end

  def validate_cols
    cols = columns
    cols.all? do |col|
      filtered(col)
    end
  end

  def validate_area
    areas = extract_areas
    areas.all? do |area|
      filtered(area)
    end
  end

  private

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

  def filtered(type)
    filtered = type.reject(&:zero?)
    filtered.uniq.size == filtered.size
  end
end
