require 'byebug'
class LRUCache
  attr_accessor :cache, :tail, :head, :cache_length, :already_cached
  def initialize(num = 4)
    @cache = {}
    @tail = nil
    @head = nil
    @already_cached = {}
    @cache_length = num
  end

  def count
    @cache.length
  end

  def add(el)
    if count == @cache_length
      process_full_cache(el)
    else
      process_empty_cache(el)
    end
    @cache
  end

  def show
    p @cache.values
  end

  private

  def process_new_tail(node)
    @tail.next_node, node.prev_node = node, @tail
    @tail = node
    @cache[node] = node.value
  end

  def process_new_head
  	@cache.delete(@head)
    node = @head.next_node

    @head.next_node = nil
    @head = node
    @head.prev_node = nil
  end

  def process_full_cache(el)
    if @already_cached[el]
    	process_new_head
      process_new_tail(@already_cached[el])
    else
      node = Node.new(el)
      process_new_tail(node)
      process_new_head
      @already_cached[el] = node
    end
  end

  def process_empty_cache(el)
  	node = Node.new(el)
    if !@tail
      @head = node
      @tail = node
      @cache[node] = node.value
      @already_cached[node] = true
    else
      @tail.next_node, @tail = node, node
      @tail.prev_node = @head
      @cache[node] = node.value
      @already_cached[node] = true
    end
  end

end

class Node
  attr_accessor :value, :prev_node, :next_node

  def initialize(value)
    @value = value
    @prev_node = nil
    @next_node = nil
  end
end

cake = LRUCache.new
cake.add(1)
cake.add(2)
cake.add(3)
cake.add(4)
cake.show
cake.add(5)
cake.show
p cake.head
