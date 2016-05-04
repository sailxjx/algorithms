class Solution {
  func combinationSum2(candidates: [Int], _ target: Int) -> [[Int]] {
    let candidates = candidates.sort()
    var results = [[Int]]()
    for (i, n) in candidates.enumerate() {
      if n > target {
        return results
      } else if n == target {
        let existCombination = results.indexOf { $0 == [n] }
        if existCombination == nil {
          results.append([n])
        } else {
          break
        }
      } else {
        let remainCandidates = Array(candidates[i+1..<candidates.count])
        let subConbinations = combinationSum2(remainCandidates, target - n)
        subConbinations.forEach { subConbination in
          var subConbination = subConbination
          subConbination.insert(n, atIndex: 0)
          let existCombination = results.indexOf { $0 == subConbination }
          if existCombination == nil {
            results.append(subConbination)
          }
        }
      }
    }
    return results
  }
}

func equate(a1: [[Int]], _ a2: [[Int]]) -> Bool {
  guard a1.count == a2.count else { return false }
  for (i, v) in a1.enumerate() {
    guard v.count == a2[i].count else { return false }
    for (ii, vv) in v.enumerate() {
      guard vv == a2[i][ii] else { return false }
    }
  }
  return true
}

equate(Solution().combinationSum2([1, 1, 2, 2, 3, 3], 5), [[1,1,3],[1,2,2],[2,3]])

equate(Solution().combinationSum2([10, 1, 2, 7, 6, 1, 5], 8), [[1, 1, 6],[1, 2, 5],[1, 7],[2, 6]])

equate(Solution().combinationSum2([10, 1, 2, 7, 6, 1, 5, -10, 20, 14, 3, 3], 15), [[-10,1,1,2,3,3,5,10],[-10,1,1,2,3,5,6,7],[-10,1,1,2,5,6,10],[-10,1,1,2,7,14],[-10,1,1,3,3,7,10],[-10,1,1,3,6,14],[-10,1,1,3,20],[-10,1,1,6,7,10],[-10,1,2,3,3,6,10],[-10,1,2,3,5,14],[-10,1,2,5,7,10],[-10,1,3,3,5,6,7],[-10,1,3,5,6,10],[-10,1,3,7,14],[-10,1,10,14],[-10,2,3,3,7,10],[-10,2,3,6,14],[-10,2,3,20],[-10,2,6,7,10],[-10,3,3,5,14],[-10,3,5,7,10],[-10,5,6,14],[-10,5,20],[1,1,2,3,3,5],[1,1,2,5,6],[1,1,3,3,7],[1,1,3,10],[1,1,6,7],[1,2,3,3,6],[1,2,5,7],[1,3,5,6],[1,14],[2,3,3,7],[2,3,10],[2,6,7],[3,5,7],[5,10]]
)