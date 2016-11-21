class Simon
  attr_accessor :sequence_length, :game_over, :seq

  COLORS = %w(red blue yellow green)

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def play

    until @game_over
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 1
      system("clear")
      sleep  0.5
    end
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def require_sequence
    puts "Enter the colors with spaces in between:"
    colors = gets.chomp

    if colors.split(" ") != @seq
      @game_over = true
    end

  end

  def round_success_message
    "Congratulations! you are at #{sequence_length}"
  end

  def game_over_message
    "Sorry you lose"
  end


end
