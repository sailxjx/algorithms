/*
 Given a 2D board and a word, find if the word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

 For example,
 Given board =

 [
  ["A","B","C","E"],
  ["S","F","C","S"],
  ["A","D","E","E"]
 ]

 word = "ABCCED", -> returns true,
 word = "SEE", -> returns true,
 word = "ABCB", -> returns false.
*/
import Foundation

class Char {

  var visited = false
  var val: Character
  var neighbors = [Char]()

  init (_ val: Character) {
    self.val = val
  }

}

class Solution {

  func existWord(words: [Character], _ chars: [Char]) -> Bool {
    guard words.count > 0 else { return true }
    let firstWord = words[0]
    for char in chars {
      if char.visited || char.val != firstWord { continue }
      char.visited = true
      if existWord(Array(words[1..<words.count]), char.neighbors) {
        return true
      }
      char.visited = false
    }
    return false
  }

  func exist(board: [[Character]], _ word: String) -> Bool {
    var charBoard = [[Char]]()
    var charIdx = [Character: [Char]]()

    for line in board {
      var charLine = [Char]()
      for c in line {
        let char = Char(c)
        charLine.append(char)
        if charIdx[c] == nil {
          charIdx[c] = [char]
        } else {
          charIdx[c]?.append(char)
        }
      }
      charBoard.append(charLine)
    }

    for i in 0..<charBoard.count {
      let charLine = charBoard[i]
      for n in 0..<charLine.count {
        let char = charLine[n]
        let left: Char? = n > 0 ? charLine[n - 1] : nil
        let right: Char? = n < charLine.count - 1 ? charLine[n + 1] : nil
        let up: Char? = i > 0 ? charBoard[i - 1][n] : nil
        let down: Char? = i < charBoard.count - 1 ? charBoard[i + 1][n] : nil
        [left, right, up, down].forEach { neighbor in
          if neighbor != nil {
            char.neighbors.append(neighbor!)
          }
        }
      }
    }

    let words = Array(word.characters)
    guard words.count > 0 else { return true }

    let chars = charIdx[words[0]]
    guard chars != nil else { return false }

    return existWord(words, chars!)
  }
}

Solution().exist([
  ["A","B","C","E"],
  ["S","F","C","S"],
  ["A","D","E","E"]
], "ABCCED") == true

Solution().exist([
  ["A","B","C","E"],
  ["S","F","C","S"],
  ["A","D","E","E"]
  ], "SEE") == true

Solution().exist([
  ["A","B","C","E"],
  ["S","F","C","S"],
  ["A","D","E","E"]
  ], "ABCB") == false