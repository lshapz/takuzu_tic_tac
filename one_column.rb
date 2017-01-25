require 'byebug'

class OneColumn 
  attr_accessor :grid, :size

  def initialize(number)
    @grid = Array.new(number, Array.new(1))
    @size = number 
  end

  def generate_column_one   
    (0..@size).each do |column|
      assign_a_place(column)
    end
  end

  def assign_a_place(row)
    if @grid[row-1] == @grid[row-2] 
      @grid[row] = opposite(@grid[row-1])
    else
      @grid[row] = [1 + rand(2)]
    end 
  end

  def opposite(nearby)
    if nearby == [1] 
      [2]
    else
      [1]
    end
  end

end
foo = OneColumn.new(10)
foo.generate_column_one
p foo.grid