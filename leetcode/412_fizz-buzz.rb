# frozen_string_literal: true

def fizz_buzz(num)
  raise unless num.is_a?(Integer)

  answers = []
  (1..num).each do |i|
    answers << print_answer(i)
  end
  answers
end

def print_answer(num)
  if (num % 3).zero? && (num % 5).zero?
    'FizzBuzz'
  elsif (num % 3).zero?
    'Fizz'
  elsif (num % 5).zero?
    'Buzz'
  else
    num.to_s
  end
end

answers = fizz_buzz(15)
puts answers
