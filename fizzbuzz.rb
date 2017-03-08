require 'rspec'

class Fizzbuzz
  def output(number)
    return "FizzBuzz" if number % 15 == 0
    return "Buzz" if number % 5 == 0
    return "Fizz" if number % 3 == 0
    number
  end

  def go
    (1..100).each do |number|
      puts output(number)
    end
  end
end

fizzbuzz = Fizzbuzz.new
fizzbuzz.go

RSpec.describe Fizzbuzz do
  let(:fizzbuzz) { Fizzbuzz.new }
  describe '#output' do
    it 'should return 1 if given 1' do
      expect(fizzbuzz.output(1)).to eq(1)
    end

    it 'should return 2 if given 2' do
      expect(fizzbuzz.output(2)).to eq(2)
    end

    it 'should return Fizz if given 3' do
      expect(fizzbuzz.output(3)).to eq('Fizz')
    end

    it 'should return 4 if given 4' do
      expect(fizzbuzz.output(4)).to eq(4)
    end

    it 'should return Buzz if given 5' do
      expect(fizzbuzz.output(5)).to eq('Buzz')
    end

    it 'should return Fizz if given 6' do
      expect(fizzbuzz.output(6)).to eq('Fizz')
    end

    it 'should return Buzz if given 10' do
      expect(fizzbuzz.output(10)).to eq('Buzz')
    end

    it 'should return FizzBuzz if given 15' do
      expect(fizzbuzz.output(15)).to eq('FizzBuzz')
    end

    it 'should return FizzBuzz if given 75' do
      expect(fizzbuzz.output(75)).to eq('FizzBuzz')
    end
  end
end