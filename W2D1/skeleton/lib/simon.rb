class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
      sleep(1)
      system "clear"
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      p color
      sleep(1)
      system "clear"
    end
  end

  def require_sequence
    p "What did Simon say?:"
    colors = gets.chomp.split
    p @seq
    @game_over = true if colors != @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    p "You passed round #{@sequence_length}!"
  end

  def game_over_message
    p "Sorry, that's not it."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  simon = Simon.new
  simon.play
end
