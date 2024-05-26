The String Calculator is a Ruby class designed to add numbers provided as a string input. It's a simple utility that supports various delimiters and handles different scenarios, such as negative numbers and custom delimiters.

# Installation
You can use the String Calculator by either cloning the repository or directly downloading the string_calculator.rb file.

# Clone the repository using below link
git clone https://github.com/priyaRaghavan-code/string_calculator.git

require_relative 'string_calculator'

# Create a new instance of the StringCalculator class
calculator = StringCalculator.new

# Adding numbers using default delimiter (comma or newline)
puts calculator.add("1,2,3")  # Output: 6
puts calculator.add("1\n2,3")  # Output: 6

# Adding numbers with custom delimiter
puts calculator.add("//;\n1;2;3")  # Output: 6
puts calculator.add("//|\n1|2|3")  # Output: 6

# Handling negatives
puts calculator.add("1,-2,3")  # Raises an error: "negatives not allowed: -2"

# Ignoring large numbers
puts calculator.add("2,1001")  # Output: 2

# Adding numbers with custom delimiters of any length
puts calculator.add("//[***]\n1***2***3")  # Output: 6

# Adding numbers with multiple delimiters
puts calculator.add("//[*][%]\n1*2%3")  # Output: 6
puts calculator.add("//[;][&]\n4;5&6")  # Output: 15

# Features
- Supports addition of numbers provided as a string input.
- Handles various delimiters including comma, newline, and custom delimiters.
- Supports multiple delimiters and delimiters of any length.
- Ignores numbers larger than 1000.
- Raises an error for negative numbers, showing all negative numbers present.