require 'Game'

describe 'features' do
  it 'registers a score when pins are knocked down' do
    my_game = Game.new
    my_game.roll(1)
    my_game.roll(3)
    expect(my_game.frame).to eq(2)
  end

  it 'registers a score when pins are knocked down' do
    my_game = Game.new
    my_game.roll(1)
    my_game.roll(3)
    my_game.roll(4)
    expect(my_game.frame).to eq(2)
  end
end
