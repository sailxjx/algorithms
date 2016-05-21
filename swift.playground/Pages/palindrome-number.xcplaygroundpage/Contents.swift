/*
 Determine whether an integer is a palindrome. Do this without extra space.

 Some hints:
 Could negative integers be palindromes? (ie, -1)

 If you are thinking of converting the integer to string, note the restriction of using extra space.

 You could also try reversing an integer. However, if you have solved the problem "Reverse Integer", you know that the reversed integer might overflow. How would you handle such case?

 There is a more generic way of solving this problem.
*/

// Reference: https://leetcode.com/discuss/33500/an-easy-lines-code-only-reversing-till-half-and-then-compare

import Foundation

class Solution {
  func isPalindrome(x: Int) -> Bool {
    if x < 0 || (x != 0 && x % 10 == 0) { return false }
    var sum = 0
    var x = x
    while (x > sum) {
      sum =  sum * 10 + x % 10
      x = x / 10
    }
    return (x == sum) || (x == sum / 10)
  }
}

Solution().isPalindrome(121) == true
Solution().isPalindrome(10) == false
Solution().isPalindrome(13131) == true
Solution().isPalindrome(13031) == true
Solution().isPalindrome(1551) == true
Solution().isPalindrome(0) == true
Solution().isPalindrome(-121) == false
Solution().isPalindrome(112) == false
Solution().isPalindrome(1000021) == false