class Solution {
  func reverseVowels(s: String) -> String {
    let vowels = ["a", "o", "e", "i", "u", "A", "O", "E", "I", "U"]
    var answerArr = [String](count: s.characters.count, repeatedValue: "")
    var vowelStack = [String]()

    for (i, char) in s.characters.enumerate() {
      let letter = String(char)
      if vowels.indexOf(letter) == nil {
        answerArr[i] = letter
      } else {
        vowelStack.append(letter)
      }
    }

    for (i, letter) in answerArr.enumerate() {
      if letter == "" {
        answerArr[i] = vowelStack.popLast()!
      }
      if vowelStack.count == 0 {
        break
      }
    }

    return answerArr.joinWithSeparator("")
  }
}

Solution().reverseVowels("hello") == "holle"
Solution().reverseVowels("leetcode") == "leotcede"
Solution().reverseVowels("aA") == "Aa"
