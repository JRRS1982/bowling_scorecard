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

  context '.spare_bonus' do
    it 'backwards checks against spares' do
      my_game = Game.new
      my_game.roll(2)
      my_game.roll(8)
      my_game.roll(5)
      expect(my_game.score).to be(20)
    end
  end

  context '.score' do
    it 'keeps track of a zero score' do
      my_game = Game.new
      20.times { my_game.roll(0) }
      expect(my_game.score).to eq(0)
    end

    it 'keeps track of a 1 each time' do
      my_game = Game.new
      20.times { my_game.roll(1) }
      expect(my_game.score).to eq(20)
    end
  end

  context '.statement' do
    it 'prints out a heading' do
      my_game = Game.new
      expect(my_game.statement).to include("Frame || Roll 1 || Roll 2 || Frame Score || Total")
    end
  end
end
