module MazeSolver
  class Position
    ## Position Of Element in the maze  (Cartesians)##
    attr_reader :x, :y # column, row position respectively

    def initialize(x, y)
      @x = x
      @y = y
    end

    def ==(position)
      ## Compare two positions ##
      @x == position.x && @y == position.y
    end

    def to_s
      ## Represent a Position ##
      "(#{@x}, #{@y})"
    end

    ## Adjacent position (In a Cartesian way) ##
    def north
      Position.new(@x, @y-1)
    end

    def east
      Position.new(@x+1, @y)
    end

    def south
      Position.new(@x, @y+1)
    end

    def west
      Position.new(@x-1, @y)
    end
  end
end