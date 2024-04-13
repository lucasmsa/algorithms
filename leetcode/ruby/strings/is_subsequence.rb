# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  return true if s.empty?

  s_pointer = 0

  t.each_char do |t_character|
    if s_pointer == s.length
      return true
    elsif s[s_pointer] == t_character
      s_pointer += 1
    end
  end

  s_pointer >= s.length
end
