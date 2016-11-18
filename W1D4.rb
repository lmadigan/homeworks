class Stack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def add(el)
    stack << el
  end

  def remove
    stack.pop
  end

  def show
    p stack
  end
end

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    p @queue
  end

end

class Map
  attr_accessor :map

  def initialize
    @map = []
  end

  def assign(key, value)
    reassign = false
    ind = nil
    @map.each_with_index do |el, index|
      if el[0] == key
        reassign = true
        ind = index
      end
    end
    reassign ? @map[ind] = [key, value] : @map << [key, value]
  end

  def lookup(key)
    map.each do |el|
      return el[1] if el[0] == key
    end
    nil
  end

  def remove(key)
    map.each_with_index do |el, ind|
      map.delete_at(ind) if el[0] == key
    end
  end


end
