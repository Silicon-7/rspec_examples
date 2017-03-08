require 'rspec'
require 'benchmark'

class ChangeMachine
  def change(cents)
    coins = []
    denominations = [25, 10, 5, 1]
    denominations.each do |denomination|
      while cents >= denomination
        cents -= denomination
        coins << denomination
      end
    end
    coins
  end

  def change_with_map(cents)
    denominations = [25, 10, 5, 1]
    denominations.map.with_object([]) do |denomination, denomination_collection|
      while cents >= denomination
        cents -= denomination
        denomination_collection << denomination
      end
      denomination_collection
    end
  end
end
change_machine = ChangeMachine.new

puts Benchmark.measure { change_machine.change(119) }
puts Benchmark.measure { change_machine.change_with_map(119) }


RSpec.describe ChangeMachine do
  let(:change_machine) {  ChangeMachine.new }
  describe '#change' do
    it 'should return [1] if given 1' do
      expect(change_machine.change(1)).to eq([1])
    end

    it 'should return [1, 1] if given 2' do
      expect(change_machine.change(2)).to eq([1, 1])
    end

    it 'should return [1, 1, 1] if given 3' do
      expect(change_machine.change(3)).to eq([1, 1, 1])
    end

    it 'should return [1, 1, 1, 1] if given 4' do
      expect(change_machine.change(4)).to eq([1, 1, 1, 1])
    end

    it 'should return [5] if given 5' do
      expect(change_machine.change(5)).to eq([5])
    end

    it 'should return [5, 1] if given 6' do
      expect(change_machine.change(6)).to eq([5, 1])
    end

    it 'should return [5, 1, 1] if given 7' do
      expect(change_machine.change(7)).to eq([5, 1, 1])
    end

    it 'should return [5, 1, 1, 1] if given 8' do
      expect(change_machine.change(8)).to eq([5, 1, 1, 1])
    end

    it 'should return [5, 1, 1, 1, 1] if given 9' do
      expect(change_machine.change(9)).to eq([5, 1, 1, 1, 1])
    end

    it 'should return [10] if given 10' do
      expect(change_machine.change(10)).to eq([10])
    end

    it 'should return [10, 1] if given 11' do
      expect(change_machine.change(11)).to eq([10, 1])
    end

    it 'should return [10, 5] if given 15' do
      expect(change_machine.change(15)).to eq([10, 5])
    end

    it 'should return [10, 5, 1] if given 16' do
      expect(change_machine.change(16)).to eq([10, 5, 1])
    end

    it 'should return [10, 5, 1, 1] if given 17' do
      expect(change_machine.change(17)).to eq([10, 5, 1, 1])
    end

    it 'should return [10, 10] if given 20' do
      expect(change_machine.change(20)).to eq([10, 10])
    end

    it 'should return [25] if given 25' do
      expect(change_machine.change(25)).to eq([25])
    end

    it 'should return [25, 25, 25, 25, 10, 5, 1, 1, 1, 1] if given 119' do
      expect(change_machine.change(119)).to eq([25, 25, 25, 25, 10, 5, 1, 1, 1, 1])
    end

    it 'should return [25, 25, 25, 10, 10, 1, 1, 1, 1] if given 99' do
      expect(change_machine.change(99)).to eq([25, 25, 25, 10, 10, 1, 1, 1, 1])
    end

    it 'should return [25, 25, 10, 5, 1, 1] if given 67' do
      expect(change_machine.change(67)).to eq([25, 25, 10, 5, 1, 1])
    end
  end
end