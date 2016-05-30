/*
 Given two strings s and t, write a function to determine if t is an anagram of s.

 For example,
 s = "anagram", t = "nagaram", return true.
 s = "rat", t = "car", return false.

 Note:
 You may assume the string contains only lowercase alphabets.

 Follow up:
 What if the inputs contain unicode characters? How would you adapt your solution to such case?
 */

class Solution {
  func isAnagram(s: String, _ t: String) -> Bool {
    guard s.characters.count == t.characters.count else { return false }
    var charMap = [Character: Int]()
    s.characters.forEach { char in
      if charMap[char] == nil {
        charMap[char] = 1
      } else {
        charMap[char]! += 1
      }
    }
    for char in t.characters {
      guard charMap[char] != nil else { return false }
      charMap[char]! -= 1
      guard charMap[char] >= 0 else { return false }
    }
    return true
  }
}

Solution().isAnagram("ss", "s") == false
Solution().isAnagram("anagram", "nagaram") == true
Solution().isAnagram("rat", "car") == false