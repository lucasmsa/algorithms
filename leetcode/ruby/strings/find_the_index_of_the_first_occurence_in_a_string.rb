# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  (0...haystack.length).each do |index|
    break if index + needle.length > haystack.length

    character = haystack[index]

    return index if character == needle[0] &&
                    (haystack[index..index + needle.length - 1] == needle)
  end

  -1
end
