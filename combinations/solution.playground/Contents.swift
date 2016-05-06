class Solution {
  func combinePostfix(start: Int, _ n: Int, _ k: Int) -> [[Int]] {
    var combinations = [[Int]]()
    if k == 1 { return (start...n).map {return [$0]} }
    if n - start + 1 == k { return [Array(start...n)] }
    let max = n - k + 1
    for i in start...max {
      let postfixes = combinePostfix(i + 1, n, k - 1)
      combinations += postfixes.map { postfix in
        var postfix = postfix
        postfix.insert(i, atIndex: 0)
        return postfix
      }
    }
    return combinations
  }

  func combine(n: Int, _ k: Int) -> [[Int]] {
    let combinations = combinePostfix(1, n, k)
    return combinations
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

let s1 = [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
equate(Solution().combine(4, 2), s1)
let s2 = [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
equate(Solution().combine(4, 3), s2)
let s3 = [[1,2,3],[1,2,4],[1,2,5],[1,2,6],[1,3,4],[1,3,5],[1,3,6],[1,4,5],[1,4,6],[1,5,6],[2,3,4],[2,3,5],[2,3,6],[2,4,5],[2,4,6],[2,5,6],[3,4,5],[3,4,6],[3,5,6],[4,5,6]]
equate(Solution().combine(6, 3), s3)