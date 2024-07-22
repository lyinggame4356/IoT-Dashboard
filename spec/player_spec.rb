require 'player'

describe Player do

  subject(:player) { described_class.new('Ed') }

  before do
    allow(Kernel).to receive(:rand).and_return(17)
  end

  describe '#hp' do
    it 'should initialize with HP equal to 100' do
      expect(player.hp).to eq 100
    end
  end

  describe '#name' do
    it 'should return the players name' do
      expect(player.name).to eq 'Ed'
    end
  end

  describe '#attacked' do
    it 'should reduce HP by 20' do
      expect{player.attacked}.to change{player.hp}.by (-17)
    end
  end

  describe '#computer' do
    it 'should not be a computer' do
      expect(player.computer).to eq false
    end
  end

end
