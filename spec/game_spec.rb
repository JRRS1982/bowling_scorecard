require 'Game'
require 'pry'

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

    it 'increments up when two balls are rolled' do
      my_game = Game.new
      my_game.roll(3)
      my_game.roll(7)
      expect(my_game.frame).to eq(2)
    end
  end

  context '.over?' do
    it 'ends the game after throwing 20 gutter balls' do
      my_game = Game.new
      20.times { my_game.roll(0) }
      expect(my_game.over?).to be(true)
    end

    it 'is not over at the start' do
      my_game = Game.new
      expect(my_game.over?).to be(false)
    end
  end

  context '.a_strike?' do
    it 'knows what a strike is' do
      my_game = Game.new
      my_game.roll(10)
      expect(my_game.a_strike?(my_game.score_array[0])).to be(true)
    end

    it "knows what a strike isn't" do
      my_game = Game.new
      my_game.roll(4)
      expect(my_game.a_strike?(my_game.score_array[0])).to be(false)
    end
  end

  context '.a_spare?' do
    it 'knows what a spare is' do
      my_game = Game.new
      my_game.roll(3)
      my_game.roll(7)
      expect(my_game.a_spare?(my_game.score_array[0])).to be(true)
    end

    it "knows what a spare isn't" do
      my_game = Game.new
      my_game.roll(3)
      my_game.roll(2)
      expect(my_game.a_spare?(my_game.score_array[0])).to be(false)
    end
  end
end
