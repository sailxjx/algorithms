/*
 Given an integer, write a function to determine if it is a power of three.

 Follow up:
 Could you do it without using any loop / recursion?

 Credits:
 Special thanks to @dietpepsi for adding this problem and creating all test cases.
*/

// Reference: https://leetcode.com/discuss/78532/summary-all-solutions-new-method-included-at-15-30pm-jan-8th
import Foundation

let maxPowerOfThree = pow(3.0, floor(log(Double(Int32.max)) / log(3.0)))

class Solution {
  func isPowerOfThree(n: Int) -> Bool {
    return n > 0 && Int(maxPowerOfThree) % n == 0;
  }
}

Solution().isPowerOfThree(9) == true
Solution().isPowerOfThree(8) == false
Solution().isPowerOfThree(81) == true
