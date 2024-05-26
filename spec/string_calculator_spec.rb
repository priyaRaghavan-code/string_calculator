require 'rspec'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { described_class.new }

  shared_examples "a string calculator" do |input, result|
    it "returns #{result} for input '#{input}'" do
      expect(calculator.add(input)).to eq(result)
    end
  end

  shared_examples "a string calculator with error" do |input, error_message|
    it "raises an error for input '#{input}'" do
      expect { calculator.add(input) }.to raise_error(error_message)
    end
  end

  context "handling one or two numbers" do
    it_behaves_like "a string calculator", "", 0
    it_behaves_like "a string calculator", "1", 1
    it_behaves_like "a string calculator", "5", 5
    it_behaves_like "a string calculator", "1,2", 3
    it_behaves_like "a string calculator", "3,5", 8
  end

  context "handling multiple numbers" do
    it_behaves_like "a string calculator", "1,2,3", 6
    it_behaves_like "a string calculator", "4,5,6", 15
  end

  context "handling new lines" do
    it_behaves_like "a string calculator", "1\n2,3", 6
    it_behaves_like "a string calculator", "4\n5,6", 15
  end

  context "handling different delimiters" do
    it_behaves_like "a string calculator", "//;\n1;2", 3
    it_behaves_like "a string calculator", "//|\n1|2|3", 6
    it_behaves_like "a string calculator", "//[***]\n1***2***3", 6
    it_behaves_like "a string calculator", "//[###]\n4###5###6", 15
    it_behaves_like "a string calculator", "//[*][%]\n1*2%3", 6
    it_behaves_like "a string calculator", "//[;][&]\n4;5&6", 15
    it_behaves_like "a string calculator", "//[***][%%%]\n1***2%%%3", 6
    it_behaves_like "a string calculator", "//[###][&&&]\n4###5&&&6", 15
  end

  context "handling negatives" do
    it_behaves_like "a string calculator with error", "1,-2,3", "negatives not allowed: -2"
    it_behaves_like "a string calculator with error", "-1,-2,3", "negatives not allowed: -1, -2"
  end

  context "handling large numbers" do
    it_behaves_like "a string calculator", "2,1001", 2
    it_behaves_like "a string calculator", "1000,1001,2", 1002
  end
end
