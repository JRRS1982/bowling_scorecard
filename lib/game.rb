class Game  
  attr_accessor :score

  def initialize
    @score = 0
  end

  def frame
    2
  end

  def roll(pins)
    @score += pins
  end
end
