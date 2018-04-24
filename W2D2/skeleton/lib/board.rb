class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |arr, idx|
      next if idx == 6 || idx == 13
      4.times {arr << :stone}
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if @cups[start_pos].nil? || @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_index = start_pos

    until stones.empty?
      cup_index += 1
      cup_index = 0 if cup_index > 13
      if cup_index == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_index == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_index] << stones.pop
      end
    end

    render
    next_turn(cup_index)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..6].all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    count1 = @cups[6].count
    count2 = @cups[13].count

    if count1 == count2
      :draw
    else
      count1 > count2 ? @name1 : @name2
    end
  end
end
