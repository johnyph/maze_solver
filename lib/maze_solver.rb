require "maze_solver/version"
require "maze_solver/position"
require "maze_solver/element"
require "maze_solver/maze"

module MazeSolver

  def solve(file_name)
    
    maze_array = from_file(file_name)
    maze_list = to_maze(maze_array)
    maze = Maze.new(maze_list)
   
    to_image(maze_list, maze.solve, maze_array)
  end
  
  def from_file(file_name)
    ## Read file and export it to a 2D array
    ## Throw error if file doesnt exist
    begin
      File.readlines(file_name).map { |line| line.split('') }
    rescue abort("can't open #{file_name}" )
    end
  end

  def to_image(maze, shortest_path, maze_array)
   
    maze.each do |element|
      maze_array[element.position.y][element.position.x] = '*' if shortest_path.find { |se| se == element }
    end

    puts '!!!!!!!SOLUTIOM!!!!!!!'
    print maze_array.join('')
    puts '^^^^^^^^^^^^^^^^^^^^^^'
  end

  def to_maze(maze_array)
    maze = []  
    maze_array.each_with_index do |line, line_index|
      line.each_with_index do |char, col_index|
        case char
          when '_' 
            then maze << Element.new(char, Position.new(col_index, line_index,), 'PATH')
          when 'X'
            then maze << Element.new(char, Position.new(col_index, line_index,), 'WALL')
          when 'S'
            then maze << Element.new(char, Position.new(col_index, line_index,), 'START')
          when 'G'
            then maze <<  Element.new(char, Position.new(col_index, line_index,), 'GOAL' )
        end
      end
    end
    maze
  end

  module_function :solve, :from_file, :to_maze, :to_image
end

