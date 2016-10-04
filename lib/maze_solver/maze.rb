require "maze_solver/tree"

module MazeSolver
  class Maze
    ## Class which Represent the maze

    attr_reader :maze

    def initialize(maze)
      @maze = maze
      @closed = [] # Already proccessed

      set_start_and_goal
    end

    def solve
      ## Begin process !!
      tree = Tree.new # Instanciate a tree with start point as first pushing
      tree.push(@start, @start.f)

      reverse_path( algorithm(tree) ) # RUUUN
    end

    private

    def algorithm(tree)
      ## Core of this gem
      ## Recurcive implementetion

      element = tree.next
      @closed.push(element)

      return element if element.is_goal? ## Found EXIT!!!!

      neighbors(element).each do |neighbor|
        if !in_closed?(neighbor)
       
          if tree.in?(neighbor, neighbor.f)
            if neighbor.g > element.g + 1
              update_neighbor(neighbor, element)
            end
          else

            update_neighbor(neighbor, element)
            tree.push(neighbor, neighbor.f)
          end
        end
      end

      algorithm(tree)
    end

    def set_start_and_goal
      ## Check and set if there is start and goal point
      start = []
      goal = []

      @maze.each do |elem|
        start << elem if elem.type == 'START'
        goal << elem if elem.type == 'GOAL'
      end

      abort('Check if there is exactly 
        one start and one end point') if (start.length != 1 || goal.length != 1 )

      @start = start.pop
      @goal = goal.pop
    end

    def reverse_path(element, acc=[])
      ## Recurcively find path
      return acc << element if element == @start

      acc << element
      reverse_path(element.parent, acc)
    end

    def in_closed?(element)
      ## Is the element proccessed?
      @closed.find { |ce| ce == element }
    end

    def h(element)
      ## heuristic function (Guessing distance to goal)
      ## I implement it this way can be implement it with another way
      ( @goal.position.x - element.position.x ).abs + 
        ( @goal.position.y - element.position.y ).abs
    end

    def valid_neighbor(position)
      ## Check if neighbor is a valid path (_, G, S )
      neighbor = @maze.find { |elem| elem.position == position }

      if (neighbor)
        return neighbor if neighbor.is_path?
      end 
      nil
    end

    def neighbors(element)
      ## Adjacent Elements !!Only valid ones!!
      neighbors = []

      directions = [ 
        element.position.north,
        element.position.east,
        element.position.south,
        element.position.west 
      ]

      directions.each do |d|
        neighbor = valid_neighbor(d)
        neighbors << neighbor if neighbor
      end
      neighbors
    end

    def update_neighbor(neighbor, element)
      ## process neighbor

      neighbor.g = element.g + 1
      neighbor.h = h(neighbor)
      neighbor.f = neighbor.g + neighbor.h
      neighbor.parent = element
    end

  end
end