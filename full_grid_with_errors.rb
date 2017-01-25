require 'byebug'

class Puzzle 
  attr_accessor :grid, :size

  def initialize(number)
    @grid = Array.new(number)
      (0..number-1).each {|x| @grid[x] = Array.new(number)}
    @size = number 
  end


  def generate_row_one   
    (0..@size-1).each do |row_one|
      assign_first_row(row_one)
    end
  end

  def assign_first_row(row)
    if @grid[0][row-1] == @grid[0][row-2] 
      @grid[0][row] = opposite(@grid[0][row-1])
    else
      @grid[0][row] = 1 + rand(2)
    end 
  end

  def generate_column_one   
    (0..@size-1).each do |column|
      assign_first_column(column)
    end
  end

  def assign_first_column(column)
    # p @grid
    if @grid[column-1][0] == @grid[column-2][0] 
      @grid[column][0] = opposite(@grid[column-1][0])
    else
      @grid[column][0] = 1 + rand(2)
    end 
  end

  def generate_row_two
    (1..@size-1).each do |row_two|
      assign_second_row(row_two)
    end
  end

  def assign_second_row(row)
    if @grid[1][row-1] == @grid[1][row-2] 
      @grid[1][row] = opposite(@grid[1][row-1])
    else
      @grid[1][row] = 1 + rand(2)
    end 
  end

  def generate_column_two
    (1..@size-1).each do |col_two|
      assign_second_column(col_two)
    end
  end 

   def assign_second_column(column)
    if @grid[column-1][1] == @grid[column-2][1] 
      @grid[column][1] = opposite(@grid[column-1][1])
    else
      @grid[column][1] = 1 + rand(2)
    end 
  end

  def generate_rest_of_rows
    x = 2 
    (2..@size-1).each do |row|
      (x..@size-1).each do |y|
        assign_rest_of_rows(row, y)
      end
    end
  end

  def assign_rest_of_rows(row, x)
    # p @grid[x][row]
    # p [x, row]
    if @grid[x][row-1] == @grid[x][row-2] && @grid[x-1][x] == @grid[x-2][x]
      @grid[x][row] = opposite(@grid[x][row-1])
    elsif @grid[x][row-1] == @grid[x][row-2]
      @grid[x][row] = opposite(@grid[x][row-1])
    elsif @grid[x-1][x] == @grid[x-2][x]
       @grid[x][row] = opposite(@grid[x-1][x])
    else
      @grid[x][row] = 1 + rand(2)
    end
  end


  def assign_second_row(row)
    if @grid[1][row-1] == @grid[1][row-2] 
      @grid[1][row] = opposite(@grid[1][row-1])
    else
      @grid[1][row] = 1 + rand(2)
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
foo = Puzzle.new(6)
foo.generate_row_one
foo.generate_column_one
foo.generate_row_two
foo.generate_column_two
foo.generate_rest_of_rows
p foo.grid