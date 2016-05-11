/*
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

 Note: You can only move either down or right at any point in time.
*/

// Reference: https://leetcode.com/discuss/38360/10-lines-28ms-o-n-space-dp-solution-in-c-with-explanations

class Solution {
  func minPathSum(grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    var cur = [Int]([grid[0][0]])
    for i in 1..<m {
      cur.append(cur[i - 1] + grid[i][0])
    }
    for j in 1..<n {
      cur[0] += grid[0][j]
      for i in 1..<m {
        cur[i] = min(cur[i - 1], cur[i]) + grid[i][j]
      }
    }
    return cur[m - 1]
  }
}

// m x n
Solution().minPathSum([[0]]) == 0

let g1 = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]
Solution().minPathSum(g1) == 21

let g2 = [
  [1,3,5,8,9,9,2],
  [9,4,0,4,8,8,3],
  [7,9,8,4,8,3,0],
  [1,7,9,5,8,9,5],
  [1,2,1,5,0,2,1]
]

Solution().minPathSum(g2) == 29

let g3 = [[7,1,3,5,8,9,9,2,1,9,0,8,3,1,6,6,9,5],[9,5,9,4,0,4,8,8,9,5,7,3,6,6,6,9,1,6],[8,2,9,1,3,1,9,7,2,5,3,1,2,4,8,2,8,8],[6,7,9,8,4,8,3,0,4,0,9,6,6,0,0,5,1,4],[7,1,3,1,8,8,3,1,2,1,5,0,2,1,9,1,1,4],[9,5,4,3,5,6,1,3,6,4,9,7,0,8,0,3,9,9],[1,4,2,5,8,7,7,0,0,7,1,2,1,2,7,7,7,4],[3,9,7,9,5,8,9,5,6,9,8,8,0,1,4,2,8,2],[1,5,2,2,2,5,6,3,9,3,1,7,9,6,8,6,8,3],[5,7,8,3,8,8,3,9,9,8,1,9,2,5,4,7,7,7],[2,3,2,4,8,5,1,7,2,9,5,2,4,2,9,2,8,7],[0,1,6,1,1,0,0,6,5,4,3,4,3,7,9,6,1,9]]

Solution().minPathSum(g3) == 85
