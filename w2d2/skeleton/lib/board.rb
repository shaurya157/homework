class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new(4) { :stone }}
    @cups[6], @cups[13] = [], []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0, 13) &&
    !@cups[start_pos].empty? &&
    (start_pos == 6 || start_pos == 13)

    true
  end

  def make_move(start_pos, current_player_name)
    @cups[start_pos], stones = [], @cups[start_pos]

    until stones.length == 0
      start_pos += 1
      start_pos = 0 if start_pos > 13

      if start_pos == 6
        @cups[start_pos] << stones.pop if current_player_name == @name1
      elsif start_pos == 13
        @cups[start_pos] << stones.pop if current_player_name == @name2
      else
        @cups[start_pos] << stones.pop
      end
    end

    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].length == 1
    return ending_cup_idx if @cups[ending_cup_idx].length > 1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    arr1 = (0..5).map { |n| @cups[n] }
    arr2 = (7..12).map { |n| @cups[n] }

    arr1.all? { |cup| cup.empty? } || arr2.all? { |cup| cup.empty? }
  end

  def winner
    return :draw if @cups[6] == @cups[13]
    @cups[6].length > @cups[13].length ? @name1 : @name2
  end
end
