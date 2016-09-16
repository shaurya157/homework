# Monkey patching deep_dup so we don't do it 3 times later on.
class Array
  def deep_dup
    result = []
    self.each do |num|
      result << (self.is_a?(Hash) ? num.deep_dup : num)
    end
    result
  end
end

class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.deep_dup
  end
end

class Queue
  def initialize
    @stack = []
  end

  def enqueue(el)
    @stack << el
  end

  def dequeue
    @stack.shift
  end

  def show
    @stack.deep_dup
  end
end

class Map
  def initialize
    @map = []
  end

  def lookup(key)
    @map.find { |arr| arr[0] == key }
  end

  def assign(key, value)
    index = @map.index(lookup(key))
    index ? @map[index][1] = value : @map << [key, value]
  end

  def delete(key)
    index = @map.index(lookup(key))
    @map.delete_at(index) if index
  end

  def show
    @map.deep_dup
  end
end
