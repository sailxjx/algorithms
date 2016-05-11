/*
 Given two strings s and t, determine if they are isomorphic.

 Two strings are isomorphic if the characters in s can be replaced to get t.

 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.

 For example,

 Given "egg", "add", return true.

 Given "foo", "bar", return false.

 Given "paper", "title", return true.

 Note: You may assume both s and t have the same length.
*/

class Solution {
  func isIsomorphic(s: String, _ t: String) -> Bool {
    guard s.characters.count == t.characters.count else { return false }
    var charMap = [Character: Character]()
    let sChars = Array(s.characters)
    let tChars = Array(t.characters)
    for (i, key) in sChars.enumerate() {
      let tChar = tChars[i]
      if charMap[key] == nil {
        if charMap.values.indexOf(tChar) != nil {
          return false
        } else {
          charMap[key] = tChar
        }
      } else if charMap[key] == tChar {
        continue
      } else {
        return false
      }
    }
    return true
  }
}

Solution().isIsomorphic("egg", "add") == true
Solution().isIsomorphic("foo", "bar") == false
Solution().isIsomorphic("paper", "title") == true
Solution().isIsomorphic("ababdef", "efefekr") == false
