class Solution {

  func findCombinations(candidates: [Int], _ target: Int) -> [[Int]] {
    var candidates = candidates
    var results = [[Int]]()
    var resultKeys = [String: Bool]()
    while candidates.count > 0 {
      let n = candidates.removeFirst()
      if n > target {
        return results
      } else if n == target {
        let resultKey = String([n])
        if resultKeys[resultKey] == nil {
          results.append([n])
          resultKeys[resultKey] = true
        }
        return results
      } else {
        let subConbinations = findCombinations(candidates, target - n)
        subConbinations.forEach { subConbination in
          var subConbination = subConbination
          subConbination.insert(n, atIndex: 0)
          let resultKey = String(subConbination)
          if resultKeys[resultKey] == nil {
            results.append(subConbination)
            resultKeys[resultKey] = true
          }
        }
      }
    }
    return results
  }

  func combinationSum2(candidates: [Int], _ target: Int) -> [[Int]] {
    let candidates = candidates.sort()
    let results = findCombinations(candidates, target)
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

equate(Solution().combinationSum2([23,32,22,19,29,15,11,26,28,20,34,5,34,7,28,33,30,30,16,33,8,15,28,26,17,10,25,12,6,17,30,16,6,10,23,22,20,29,14,5,6,5,5,6,29,20,34,24,16,7,22,11,17,7,33,21,13,15,29,6,19,16,10,21,21,28,8,6], 27), [[5,5,5,5,7],[5,5,5,6,6],[5,5,5,12],[5,5,6,11],[5,5,7,10],[5,5,17],[5,6,6,10],[5,6,8,8],[5,6,16],[5,7,7,8],[5,7,15],[5,8,14],[5,10,12],[5,11,11],[5,22],[6,6,7,8],[6,6,15],[6,7,7,7],[6,7,14],[6,8,13],[6,10,11],[6,21],[7,7,13],[7,8,12],[7,10,10],[7,20],[8,8,11],[8,19],[10,17],[11,16],[12,15],[13,14]]
)