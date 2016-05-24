# Given a string s and a dictionary of words dict, determine if s can be segmented into a space-separated sequence of one or more dictionary words.
#
# For example, given
# s = "leetcode",
# dict = ["leet", "code"].
#
# Return true because "leetcode" can be segmented as "leet code".

# # @param {String} s
# # @param {Set<String>} word_dict
# # @return {Boolean}
# def word_break(s, word_dict)
#   return true if s.length == 0
#   canBreak = false
#   word_dict.each do |char|
#     next unless s.include? char
#     segments = s.split(char)
#     canBreak = segments.all? { |segment| word_break segment, word_dict }
#     break if canBreak
#   end
#   canBreak
# end

# @param {String} s
# @param {Set<String>} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  return true if s.length == 0
  solves = [true]
  for i in 1..s.length
    for j in 0...i
      # solves[0...j] can be segmented
      if solves[j] and word_dict.include? s[j...i]
        solves[i] = true
        break
      end
    end
  end
  solves[s.length] or false
end

raise unless word_break("leetcode", ["leet", "code"]) == true
raise unless word_break("leetcode", ["lee", "code"]) == false
raise unless word_break("aaaaaaa", ["aaaa","aaa"]) == true
raise unless word_break("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab", ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]) == false
