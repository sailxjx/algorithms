/*
 Given an integer (signed 32 bits), write a function to check whether it is a power of 4.

 Example:
 Given num = 16, return true. Given num = 5, return false.

 Follow up: Could you solve it without loops/recursion?

 Credits:
 Special thanks to @yukuairoy for adding this problem and creating all test cases.
*/

// Reference:
// https://leetcode.com/discuss/99738/simplest-c-solution-maybe
// https://leetcode.com/discuss/100939/simple-c-o-1-solution-without-0x55555555

class Solution {
  func isPowerOfFour(num: Int) -> Bool {
    return (num - 1) & num == 0 && (num - 1) % 3 == 0
  }
}

Solution().isPowerOfFour(16) == true
Solution().isPowerOfFour(5) == false
