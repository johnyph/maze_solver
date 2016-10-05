require "maze_solver/version"
require "maze_solver/position"
require "maze_solver/element"
require "maze_solver/maze"
require "json"

module MazeSolver

  def to_json(file_name)
    
    maze_array = from_file(file_name)
    maze_list = to_maze(maze_array)
    maze = Maze.new(maze_list)
    solution = maze.solve

    solution_array = solution.map do |element|
      { value: element.value, position: "(#{element.position.x}, #{element.position.y})" }
    end

    JSON.generate(solution_array)
  end

  def to_image(file_name)
    ## Print solution to console
    maze_array = from_file(file_name)
    maze_list = to_maze(maze_array)
    maze = Maze.new(maze_list)
    solution = maze.solve

    maze_list.each do |element|
      maze_array[element.position.y][element.position.x] = '*' if solution.find { |se| se == element }
    end

    puts '!!!!!!!SOLUTIOM!!!!!!!'
    print maze_array.join('')

    nil
  end

  private

  def from_file(file_name)
    ## Read file and export it to a 2D array
    ## Throw error if file doesnt exist

    begin
      File.readlines(file_name).map { |line| line.split('') }
    rescue abort("can't open #{file_name}" )
    end
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

  module_function :to_json, :from_file, :to_maze, :to_image
end

