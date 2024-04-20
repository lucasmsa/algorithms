# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  return 0 unless n
  return 1 if n == 1
  return 2 if n == 2

  ways_of_climbing_stairs = 0

  ways_of_climbing_second_to_last_step = 1
  ways_of_climbing_last_step = 2

  (2...n).each do |_index|
    ways_of_climbing_stairs = [
      ways_of_climbing_second_to_last_step + ways_of_climbing_last_step,
      ways_of_climbing_last_step + 1
    ].max

    ways_of_climbing_second_to_last_step = ways_of_climbing_last_step
    ways_of_climbing_last_step = ways_of_climbing_stairs
  end

  ways_of_climbing_last_step
end
