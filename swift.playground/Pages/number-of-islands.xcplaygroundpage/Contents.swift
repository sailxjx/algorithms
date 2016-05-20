/*
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 Example 1:

 11110
 11010
 11000
 00000

 Answer: 1

 Example 2:

 11000
 11000
 00100
 00011

 Answer: 3

 Credits:
 Special thanks to @mithmatt for adding this problem and creating all test cases.
 */

import Foundation

func makeGrid(originData: [String]) -> [[Character]] {
  return originData.map { str in
    return Array(str.characters)
  }
}

class Island {

  var visited = false
  var portal = false
  var neighbors = [Island]()

  func visit(portal: Bool) {
    if visited { return }
    visited = true
    self.portal = portal
    neighbors.forEach { neighbor in
      neighbor.visit(false)
    }
  }

}


class Solution {

  func numIslands(grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    var islandNum = 0
    var islands = [String: Island]()
    for i in 0..<grid.count {
      for j in 0..<grid[i].count {
        guard grid[i][j] == "1" else { continue }
        let island = Island()
        islands["\(i),\(j)"] = island
        let north = islands["\(i - 1),\(j)"]
        let west = islands["\(i),\(j - 1)"]
        [north, west].forEach { neighbor in
          if neighbor != nil {
            let neighbor = neighbor!
            neighbor.neighbors.append(island)
            island.neighbors.append(neighbor)
          }
        }
      }
    }

    for (_, island) in islands {
      island.visit(true)
      if island.portal {
        islandNum += 1
      }
    }

    return islandNum
  }
}

Solution().numIslands(makeGrid([
  "11110",
  "11010",
  "11000",
  "00000"])) == 1

Solution().numIslands(makeGrid([
  "11000",
  "11000",
  "00100",
  "00011"])) == 3

Solution().numIslands(makeGrid([
  "111",
  "010",
  "111"])) == 1

Solution().numIslands(makeGrid([
  "11110",
  "00110",
  "10110",
  "00010"
  ])) == 2

Solution().numIslands(makeGrid([
  "10011101100000000000",
  "10011001000101010010",
  "00011110101100001010",
  "00011001000111001001",
  "00000001110000000000",
  "10000101011000000101",
  "00010001010101010101",
  "00010100110101101110",
  "00001001100001000101",
  "00100100000100100010",
  "10010000000100101010",
  "01000101011011101100"
  ])) == 34