class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[:stone, :stone, :stone, :stone]}
    @cups[6] = []
    @cups[13] = []
    @player1 = name1
    @player2 = name2
    #cup[6] = player1 store
    #cup[13] = player2 store
  end

  def valid_move?(start_pos)
    unless start_pos.between?(0, 5) & start_pos.between?(7, 13)
      raise "Invalid starting cup"
    end
    raise "Invalid starting cup" if @cups[starting_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones_array = @cups[start_pos]
    @cups[start_pos] = []
    ind = start_pos
    until stones_array.empty?
      ind += 1
      ind = ind % 14

      if ind == 6
        @cups[ind] << stones_array.pop if current_player_name == @player1
      elsif ind == 13
        @cups[ind] << stones_array.pop if current_player_name == @player2
      else
        @cups[ind] << stones_array.pop
      end

    end
    render
    next_turn(ind)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 13 || ending_cup_idx == 6
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
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..13].all? {|cup| cup.empty?}
  end

  def winner
    if @cups[6].length == 6 && @cups[13].length == 6
      return :draw
    elsif @cups[6].length == 6
       return @player1
     elsif @cups[13].length == 6
       return @player2
    end
  end
end
