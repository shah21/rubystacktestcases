class Stack
    def initialize()
      @stack = []
    end
    
    def push(item)
        @stack.push(item)
    end

    def pop()
        @stack.pop
    end

    def peek()
        @stack.last
    end

    def size()
        @stack.size 
    end

    def is_empty?()
        @stack.empty?
    end
end