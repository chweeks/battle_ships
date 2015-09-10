require 'board.rb'

describe Board do

  let(:ship) {double :ship, position: ["A1"], direction: :S, size: 1, hit: 0}

  it { is_expected.to respond_to(:receive_ship).with(1).argument }

  it 'should have an instance of ship on board' do
    subject.receive_ship(ship)
    expect(subject.ship_array).to include(ship)
  end

  it 'Reports missed when no ship in position targetted' do
    p1 = Player.new
    p1.board.ship_array << ship
    p1.fire("A2")
    expect(p1.board.receive_hit).to eq("Missed")
  end

  it 'Reports Hit when ship in position targetted' do
    p1 = Player.new
    p1.board.ship_array << ship
    expect(p1.fire("A1")).to eq("Hit")
  end

  it 'Reports that not all ships are sunk' do
    subject.ship_array << ship
    expect(subject.status).to eq("Still in the game")
  end

  it 'Raises error if ships overlap' do
    subject.receive_ship(ship)
    expect{subject.receive_ship(ship)}.to raise_error
    "There's already a ship there, pick another position"
  end

  it "Adds to misses when shot missed" do
    subject.receive_ship(ship)
    subject.shot << 'B1'
    subject.receive_hit
    expect(subject.misses.length).to eq(1)
  end

  it "Adds to misses when shot missed" do
    subject.receive_ship(ship)
    subject.shot << 'A1'
    subject.receive_hit
    expect(subject.hits.length).to eq(1)
  end

end
