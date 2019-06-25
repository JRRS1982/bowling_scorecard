require 'Game'

describe 'Game' do
  context '.roll' do
    it 'increments the score when pins are knocked down' do
      my_game = Game.new
      my_game.roll(1)
      expect(my_game.score).to eq(1)
    end
  end

  context '.frame' do
    it 'increments up when a ten is rolled' do
      my_game = Game.new
      my_game.roll(10)
      expect(my_game.frame).to eq(2)
    end

    it 'increments up when two balls are that equal 10' do
      my_game = Game.new
      my_game.roll(3)
      my_game.roll(7)
      expect(my_game.frame).to eq(2)
    end
  end
end
