require 'rspec'

class Calculator
  def add(number_one, number_two)
    return number_one + number_two
  end

  def subtract(number_one, number_two)
    return number_one - number_two
  end

  def multiply(number_one, number_two)
    return number_one * number_two
  end

  def divide(dividend, divisor)
    return dividend / divisor
  end

  def square(number)
    return number * number
  end

  def power(number, exponent)
    return number ** exponent
  end

  def remainder(number_one, number_two)
    number_one % number_two
  end

  def instructors_name
    j = "7"
    o = "0"
    s = "5"
    h = "4"
    name_combined = j + o + s + h
    name_combined.reverse!
  end
end

# Test
 
RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  describe '#add' do
    it 'should return the sum when given two numbers' do
      expect(calculator.add(2,4)).to eq(6)
    end
  end

  describe '#subtract' do
    it 'should return the difference between two give numbers' do 
      expect(calculator.subtract(4,2)).to eq(2)
    end
  end

  describe '#multiply' do
    it 'should return product of two numbers' do
      expect(calculator.multiply(5,3)).to eq(15)
    end
  end

  describe '#divide' do
    it 'should return the quotient of first number divided by second number' do
      expect(calculator.divide(42,7)).to eq(6)
    end
  end

  describe '#square' do
    it 'should return the product of a number times itself' do
      expect(calculator.square(5)).to eq(25)
    end
  end

  describe '#power' do
    it 'should return the product, mulitiplying the first number by itself the second given number of times' do
      expect(calculator.power(5,3)).to eq(125)
    end
  end

  describe '#remainder' do
    it 'should return the remainder of the first number divided by the second number' do
      expect(calculator.remainder(13,6)).to eq(1)
    end
  end

  describe '#instructors_name' do
    it 'should return the instructors name in calculator code' do
      expect(calculator.instructors_name).to eq('4507')
    end
  end
end








