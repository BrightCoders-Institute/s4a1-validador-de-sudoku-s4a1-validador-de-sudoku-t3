# frozen_string_literal: true

class ValidateSudoku
  def initialize(matrix)
    @matrix = matrix
  end

  def validate_all
    validate_rows && validate_cols && validate_area
  end

  def validate_rows
    @matrix.all? do |row|
      row.all? { |num| num.between?(1,9) }
    end    
  end

  def validate_cols
    cols = columns
    cols.all? do |col|
      col.all? { |num| num.between?(1,9) }
    end 
  end

  def validate_area
    
  end

  private

  def columns
    @matrix.transpose
  end

  def extract_areas
    areas = []

    @matrix.step(3) do |row|
      fila.step(3) do |col|
        area = []
        
      end
    end
  end

end
