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