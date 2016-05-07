// Answer from: 
// https://leetcode.com/discuss/99738/simplest-c-solution-maybe
// https://leetcode.com/discuss/100939/simple-c-o-1-solution-without-0x55555555

class Solution {
  func isPowerOfFour(num: Int) -> Bool {
    return (num - 1) & num == 0 && (num - 1) % 3 == 0
  }
}

Solution().isPowerOfFour(16) == true
Solution().isPowerOfFour(5) == false
