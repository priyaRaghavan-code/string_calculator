# spec/string_calculator_spec.rb

require 'rspec'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { described_class.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end

  context "basic functionality" do
    it "returns 0 for an empty string" do
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number itself for a single number" do
      expect(calculator.add("1")).to eq(1)
      expect(calculator.add("5")).to eq(5)
    end

    it "returns the sum of two numbers" do
      expect(calculator.add("1,2")).to eq(3)
      expect(calculator.add("3,5")).to eq(8)
    end
  end

  context "handling multiple numbers" do
    it "returns the sum of multiple numbers" do
      expect(calculator.add("1,2,3")).to eq(6)
      expect(calculator.add("4,5,6")).to eq(15)
    end
  end

  context "handling new lines" do
    it "returns the sum of numbers with new lines" do
      expect(calculator.add("1\n2,3")).to eq(6)
      expect(calculator.add("4\n5,6")).to eq(15)
    end
  end

  context "supporting different delimiters" do
    it "supports different single-character delimiters" do
      expect(calculator.add("//;\n1;2")).to eq(3)
      expect(calculator.add("//|\n1|2|3")).to eq(6)
    end

    it "supports delimiters of any length" do
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
      expect(calculator.add("//[###]\n4###5###6")).to eq(15)
    end

    it "supports multiple delimiters" do
      expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
      expect(calculator.add("//[;][&]\n4;5&6")).to eq(15)
    end

    it "supports multiple delimiters with length longer than one char" do
      expect(calculator.add("//[***][%%%]\n1***2%%%3")).to eq(6)
      expect(calculator.add("//[###][&&&]\n4###5&&&6")).to eq(15)
    end
  end
end
