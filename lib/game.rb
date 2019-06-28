# this is the class comment
class Game
  attr_reader :score_array

  def initialize
    @score_array = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0],
                    [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
    @roll_helper = 0
    @frame_helper = 0
  end

  def frame
    @frame_helper + 1
  end

  def over?
    if frame > 10
      true
    else
      false
    end
  end

  def score
    @score_array.flatten.reduce(&:+)
  end

  def a_strike?(array_of_two_rolls)
    array_of_two_rolls.each do |first, second|
      if first == 10
        return true
      else
        return false
      end
    end
  end

  def roll(pins)
    @score_array[@frame_helper][@roll_helper] = pins
    @roll_helper += 1
    if @roll_helper == 2 || pins == 10
      @frame_helper += 1
      @roll_helper = 0
    end
  end
end
