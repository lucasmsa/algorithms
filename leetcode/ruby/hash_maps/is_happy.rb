# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  stringified_n = n.to_s
  already_found_digits_squares = Set.new([])

  while true
    square_of_digits = 0

    stringified_n.each_char do |number|
      square_of_digits += number.to_i.pow(2)
    end

    return true if square_of_digits == 1
    break if already_found_digits_squares.include?(square_of_digits)

    already_found_digits_squares.add(square_of_digits)

    stringified_n = square_of_digits.to_s
  end

  false
end
