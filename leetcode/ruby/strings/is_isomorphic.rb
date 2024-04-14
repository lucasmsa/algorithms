# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  return false unless s.length == t.length

  characters_match = {}
  already_matched = Set.new([])

  (0...s.length).each do |index|
    s_character = s[index]
    t_character = t[index]

    if characters_match.key?(s_character)
      return false if characters_match[s_character] != t_character
    else
      characters_match[s_character] = t_character
      return false if already_matched.include?(t_character)

      already_matched.add(t_character)

    end
  end

  true
end
