require 'computer'

describe Computer do

  subject(:computer) { described_class.new('Computer')}

  before do
    allow(Kernel).to receive(:rand).and_return(17)
  end

  describe '#hp' do
    it 'should initialize with HP equal to 100' do
      expect(computer.hp).to eq 100
    end
  end

  describe '#name' do
    it 'should return the players name' do
      expect(computer.name).to eq 'Computer'
    end
  end

  describe '#attacked' do
    it 'should reduce HP by 20' do
      expect{computer.attacked}.to change{computer.hp}.by (-17)
    end
  end

  describe '#computer' do
    it 'should be a computer' do
      expect(computer.computer).to eq true
    end
  end

end
