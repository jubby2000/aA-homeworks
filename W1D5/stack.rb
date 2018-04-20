class Stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def add(el)
      # adds an element to the stack
      @stack << el
    end

    def remove
      # removes one element from the stack
      @stack.shift
    end

    def show
      # return a copy of the stack
      @stack.dup
    end
end

#you can test if you want to, you can leave your comments behind
# stack = Stack.new
# stack.add(3)
# p stack.show
# stack.add(4)
# stack.add(4)
# stack.add(4)
# p stack.show
# stack.remove
# p stack.show
