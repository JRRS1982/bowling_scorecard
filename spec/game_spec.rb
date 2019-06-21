require 'game'

describe 'Game' do
  context '.roll' do
    it 'increments the score when pins are knocked down' do
      my_game = Game.new
      my_game.roll(1)
      expect(my_game.score).to eq(1)
    end
  end

  context '.frame' do
    it 'increments up when two balls are rolled' do
      my_game = Game.new
      my_game.roll(1)
      my_game.roll(3)
      expect(my_game.frame).to eq(2)
    end
  end
end