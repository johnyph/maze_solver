module MazeSolver
  class Tree
    ## Binary Tree Interprentation for Apress Open List
    def initialize
      ## Tree in hash form with priority as key and array 
      ## of elements as value
      @tree = Hash.new { |hash, key| hash[key] = [] }
    end
     
    def to_s
      ## Representation of Tree
      o = '{'
      @tree.each do |k, v|
        o += ":#{k} => [\n" 
        v.each do |el|
          o += "#{el} \n"
        end
        o+="\n]\n"
      end
      o += "}"
    end

    def push(element, priority)
      ## push an element in the stack
      @tree[priority] << element
    end

    def in?(element, priority)
      ## check if elements is in the stack
      if @tree.has_key?(priority)
        return true if @tree[priority].find { |elem| elem == element }
      end
      false
    end  
    
    def next
      ## Poping an element

      return nil if @tree.empty?
       
      priority, element = *@tree.min # get the min priority
      result = element.shift # get the first element 
      @tree.delete(priority) if element.empty? # if branch with this priority is empty delete it
      
      return result
    end
  end
end