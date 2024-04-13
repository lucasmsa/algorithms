# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
  magazine_letters = {}

  magazine.each_char do |letter|
    if magazine_letters.key?(letter)
      magazine_letters[letter] += 1
    else
      magazine_letters[letter] = 1
    end
  end

  ransom_note.each_char do |letter|
    return false unless magazine_letters.key?(letter)

    magazine_letters[letter] -= 1

    return false if magazine_letters[letter].negative?
  end

  true
end
