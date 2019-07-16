class Board
  attr_accessor :cups, :player1, :player2

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) 
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      if idx == 6 || idx == 13
        next
      else
        @cups[idx] = Array.new(4, :stone)
      end
    end
  end

  def valid_move?(start_pos)
    if !start_pos.between?(1,6) && !start_pos.between?(7,12)
      raise "Invalid starting cup"
    end

    if (start_pos.between?(7,12) && @cups[start_pos].empty?)
      raise "Starting cup is empty"
    elsif (start_pos.between?(0,5) && @cups[start_pos].empty?)
      raise "Starting cup is empty"
    end

  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].length
    @cups[start_pos] = []
    while stones > 0
      start_pos += 1
      start_pos = start_pos % 13
      if start_pos == 13 && current_player_name == @name2
        stones -= 1
        @cups[start_pos].push :stone
      elsif start_pos == 6 && current_player_name == @name1
        stones -= 1
        @cups[start_pos].push :stone
      else
        stones -=1
        @cups[start_pos].push :stone
      end
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? { |cup| cup.empty? }
    return true if @cups[7..12].all? { |cup| cup.empty? }
    false
  end

  def winner
    if @cups[6].length > @cups[13].length
      return @player1
    elsif @cups[6].length == @cups[13].length
      return :draw
    else
      return @player2
    end
  end
end
