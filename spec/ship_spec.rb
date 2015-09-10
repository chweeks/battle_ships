require 'ship.rb'

describe Ship do

  it 'has a position when created' do
    ship = Ship.new('A1', :S, 1)
    expect(ship.position).to eq('A1')
  end

  describe "#hits" do
    it 'It is initialized with no hits' do
      ship = Ship.new('A1', :S, 1)
      expect(ship.damage).to eq(0)
    end
    it 'Will count hits when recieved' do
      ship = Ship.new('A1', :S, 1)
      ship.hit
      expect(ship.damage).to eq(1)
    end

    it 'Updates damage on the ship when hit' do
      ship = Ship.new('A1', :S, 1)
      ship.hit
      expect(ship.damage).to eq(1)
    end

    it "can be sunk" do
      ship = Ship.new('A1', :S, 1)
      ship.hit
      expect(ship.sunk).to eq("Your ship is sunk")
    end

  end

  it "converts ship position and direction to coordinates" do
    ship = Ship.new('A1', :S, 2)
    ship.convert
    expect(ship.position).to eq ([A1, A2])
  end

end
