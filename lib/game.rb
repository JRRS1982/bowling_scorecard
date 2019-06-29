# first step, creating a game class to hold the data we will need.
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
    frame > 10
  end

  def score
    @score_array.flatten.reduce(&:+)
  end

  def a_strike?(array_of_two_rolls)
    array_of_two_rolls[0] == 10
  end

  def a_spare?(array_of_two_rolls)
    temp_total = array_of_two_rolls[0] + array_of_two_rolls[1]
    temp_total == 10
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
