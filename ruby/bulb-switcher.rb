# There are n bulbs that are initially off.
# You first turn on all the bulbs.
# Then, you turn off every second bulb.
# On the third round, you toggle every third bulb (turning on if it's off or turning off if it's on).
# For the ith round, you toggle every i bulb. For the nth round, you only toggle the last bulb.
# Find how many bulbs are on after n rounds.
#
# Example:
#
# Given n = 3.
#
# At first, the three bulbs are [off, off, off].
# After first round, the three bulbs are [on, on, on].
# After second round, the three bulbs are [on, off, on].
# After third round, the three bulbs are [on, off, off].
#
# So you should return 1, because there is only one bulb is on.

# # @param {Integer} n
# # @return {Integer}
# def bulb_switch(n)
#   # 0: off, 1: on
#   bulbs = [0] * n
#   for i in 0..n
#     case i
#     when 0 then bulbs.map! { |state| 0 }
#     when 1 then bulbs.map! { |state| 1 }
#     else bulbs = bulbs.each_with_index.map { |state, index| if (index + 1) % i == 0 then state ^ 1 else state end }
#     end
#   end
#   bulbs = bulbs.find_all { |state| state == 1 }
#   bulbs.length
# end

# https://leetcode.com/discuss/75014/math-solution
# @param {Integer} n
# @return {Integer}
def bulb_switch(n)
  Math.sqrt(n).floor
end

raise unless bulb_switch(0) == 0
raise unless bulb_switch(1) == 1
raise unless bulb_switch(2) == 1
raise unless bulb_switch(3) == 1
raise unless bulb_switch(4) == 2
raise unless bulb_switch(99) == 9
