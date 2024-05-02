# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  left = 0
  right = x

  while left <= right
    middle = ((left + right) / 2).floor
    middle_square = middle * middle

    return middle if middle_square == x

    return middle - 1 if (((middle - 1) * (middle - 1)) < x) && ((middle * middle) > x)
    return middle if (((middle + 1) * (middle + 1)) > x) && ((middle * middle) < x)

    if middle_square < x
      left = middle + 1
    else
      right = middle - 1
    end
  end

  left
end
