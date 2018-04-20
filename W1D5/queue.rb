class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue.dup
  end
end

# queue = Queue.new
# queue.enqueue(3)
# queue.enqueue(4)
# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# queue.enqueue(8)
# p queue.show
# queue.dequeue
# p queue.show
