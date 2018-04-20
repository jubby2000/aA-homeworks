require 'byebug'
class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    not_in_there = true
    @map.each_with_index do |sub_arr, idx|
      if sub_arr.first == key
        @map[idx][-1] = value
        not_in_there = false
      end
    end
    @map << [key, value] if not_in_there
  end

  def lookup(key)
    @map.each do |sub_arr|
      return sub_arr.last if sub_arr.first == key
    end
  end

  def remove(key)
    @map.each_with_index do |sub_arr, idx|
      if sub_arr.first == key
        @map.delete_at(idx)
      end
    end
    @map.compact
  end

  def show
    copy = []
    @map.each do |sub_arr|
      copy << sub_arr
    end
    copy
  end
end

m = Map.new
m.assign(3, 4)
p m.show
m.assign(3, 5)
p m.show
m.assign(4, 1)
m.assign(:key, :value)
p m.show
m.assign(:key, 4)
p m.show
m.remove(3)
p m.show
