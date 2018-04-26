FISHIES = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
TILES = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up"]

def sluggish
  largest = FISHIES.first
  FISHIES.each do |fish|
    FISHIES.each do |fish2|
      if fish2.length > fish.length && fish2.length > largest.length
        largest = fish2
      end
    end
  end
  largest
end

def dominant
  prc = Proc.new {|x, y| x.length <=> y.length}
  FISHIES.merge_sort(&prc).last #{ |x, y| x.length <=> y.length }.first
end

def clever
  longest = FISHIES.first
  FISHIES.each do |fish|
    longest = fish if fish.length > longest.length
  end
  longest
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def slow_dance(direction)
  TILES.each_index do |index|
    return index if TILES[index] == direction
  end
end

def fast_dance(direction)
  TILES.index(direction)
end
