# @param {Integer[]} prices
# @return {Integer}
# O(n) Time complexity | O(1) Space complexity
def max_profit(prices)
  return 0 unless prices.length

  maximum_difference = 0
  smallest_price = prices.first

  prices.each do |price|
    if price < smallest_price
      smallest_price = price
    else
      maximum_difference = [price - smallest_price, maximum_difference].max
    end
  end

  maximum_difference
end
