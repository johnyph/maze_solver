module MazeSolver
  class Element
    ## Represent an element in the Maze, defined by his position and value
    ## There are also some Astar factors like g, h, f functions
    ## Also the precedent element, (parent)
    ## visited is a flag that aknowledge that the element had been visited
    
    attr_accessor :g, :h, :f, :parent
    attr_reader :value, :position, :type

    def to_s
      ## Represent the class
      "(#{@position}), #{@value}"
    end

    def ==(element)
      ## Compare two elements by its position
      return true if ( @position == element.position && @value == element.value && @type == element.type )
      return false
    end

    def initialize(value, position, type)
      @value = value
      @position = position
      @type = type

      ## Default Astar values
      @g = 0
      @h = 0
      @f = 0
      @parent = nil
    end

    def is_goal?
      ## is the end point?
      return true if  @type == 'GOAL' 
      false
    end

    def is_path?
      ## Can be traversed?
      return true if ( @type == 'PATH' ||  @type == 'START' || @type == 'GOAL' )
      false
    end

  end
end