/*
 Given a roman numeral, convert it to an integer.

 Input is guaranteed to be within the range from 1 to 3999.
*/

let romanNumbers: [Character: Int] = [
  Character("I"): 1,
  Character("V"): 5,
  Character("X"): 10,
  Character("L"): 50,
  Character("C"): 100,
  Character("D"): 500,
  Character("M"): 1_000
]

class Solution {
  func romanToInt(s: String) -> Int {
    var result = 0
    var stashResult = 0
    var lastNumber = 1_000_000
    s.characters.forEach { letter in
      let currentNumber: Int = romanNumbers[letter]!

      if lastNumber > currentNumber {
        // Reset all states when current number is little than last number
        // e.g. Meet XI, DX etc
        result += stashResult
        stashResult = currentNumber
      } else if lastNumber < currentNumber {
        // Subtract stathed result when current number is little than previous number
        // e.g. IX, XD
        result += currentNumber - stashResult
        stashResult = 0
      } else {
        // Save first letter or right plus letter into stashed result
        // e.g. XX, II
        stashResult += currentNumber
      }
      lastNumber = currentNumber
    }
    return result + stashResult
  }
}

Solution().romanToInt("II") == 2
Solution().romanToInt("XIII") == 13
Solution().romanToInt("MCMIV") == 1904
Solution().romanToInt("MCMLIV") == 1954
Solution().romanToInt("MCMXC") == 1990
Solution().romanToInt("MMXIV") == 2014
Solution().romanToInt("CMLII") == 952
