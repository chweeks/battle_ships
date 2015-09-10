require 'board.rb'

describe Board do

  it { is_expected.to respond_to(:receive_ship).with(1).argument }

  it 'should have an instance of ship on board' do
    ship1 = Ship.new "A1"
    subject.receive_ship(ship1)
    expect(subject.ship_array).to include(ship1)
  end

  it 'Reports missed when no ship in position targetted' do
    ship = Ship.new('A1')
    p1 = Player.new
    p1.board.ship_array << ship
    p1.fire("A2")
    expect(p1.board.receive_hit).to eq("Missed")
  end

  it 'Reports Hit when ship in position targetted' do
    ship = Ship.new('A1')
    p1 = Player.new
    p1.board.ship_array << ship
    expect(p1.fire("A1")).to eq("Hit")
  end

  it 'Updates damage on the ship when hit' do
    ship = Ship.new('A1')
    p1 = Player.new
    p1.board.ship_array << ship
    p1.fire('A1')
    p1.board.receive_hit
    expect(ship.damage).to eq(1)
  end

  it 'Reports that not all ships are sunk' do
    ship = Ship.new('A1')
    subject.ship_array << ship
    expect(subject.status).to eq("Still in the game")
  end
end
