# this is the class comment
class Game
  def initialize
    @score_array = [[0,0], [0,0], [0,0], [0,0], [0,0],
                    [0,0], [0,0], [0,0], [0,0], [0,0]]
    @roll_helper = 0
    @frame_helper = 0
  end

  def frame
    @frame_helper + 1
  end

  def score
    @score_array.flatten.reduce(&:+)
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
