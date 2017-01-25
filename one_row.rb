require 'byebug'

class OneRow
  attr_accessor :grid, :size
  
  def initialize(number)
    @grid = Array.new(number)
    @size = number 
  end

  def generate_row_one   
    (0..@size-1).each do |row_one|
      assign_a_place(row_one)
    end
  end

  def assign_a_place(row)
    if @grid[row-1] == @grid[row-2] 
      @grid[row] = opposite(@grid[row-1])
    else
      @grid[row] = 1 + rand(2)
    end 
  end

  def opposite(nearby)
    if nearby == 1 
      2
    else
      1
    end
  end

end
foo = OneRow.new(16)
foo.generate_row_one
p foo.grid
