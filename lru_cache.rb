class LRUCache
    def initialize(size)
      @stack = []
      @size = size
    end

    def count
      @stack.count
    end

    def add(el)
      if @stack.include?(el)
        @stacK.delete(el)
        @stack.push(el)
      elsif @stack.length >= size
        @stack.shift
        @stack.push(el)
      else
        @stack.push(el)
      end

    end

    def show
      p @stack
      nil
    end

    private
    # helper methods go here!

  end
