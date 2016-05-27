/*
 Related to question Excel Sheet Column Title

 Given a column title as appear in an Excel sheet, return its corresponding column number.

 For example:

 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 Credits:
 Special thanks to @ts for adding this problem and creating all test cases.

 Subscribe to see which companies asked this question
 */

import Foundation

class Solution {
  let charToNum: [Character: Int] = {
    var dict = [Character: Int]()
    let alphabet = "abcdefghijklmnopqrstuvwxyz".uppercaseString
    for (i, char) in alphabet.characters.enumerate() {
      dict[char] = i + 1
    }
    return dict
  }()

  func titleToNumber(s: String) -> Int {
    var title: Int = 0
    for (i, char) in s.characters.reverse().enumerate() {
      let num = charToNum[char]!
      title += num * Int(pow(Double(26), Double(i)))
    }
    return title
  }
}

Solution().titleToNumber("A") == 1
Solution().titleToNumber("Z") == 26
Solution().titleToNumber("AZ") == 1 * 26 + 26