import Foundation

class Solution {

  func factorial (n: Int) -> Int {
    if n == 0 || n == 1 {
      return 1
    }
    return n * factorial(n - 1)
  }

  func calPermutation(k: Int, _ permutation: [Int]) -> String {
    var list = permutation
    let n = list.count
    let r = k % factorial(n)
    if r == 0 {
      return list.reverse().map({ s in
        return String(s)
      }).joinWithSeparator("")
    }
    let idx = Int(ceil(Double(k) / Double(factorial(n - 1)))) - 1
    let seq = list[idx]
    list.removeAtIndex(idx)
    return String(seq) + calPermutation(k % factorial(n - 1), list)
  }

  func getPermutation(n: Int, _ k: Int) -> String {
    let permutation = Array(1...n)
    return calPermutation(k, permutation)
  }
}

Solution().getPermutation(1, 1) == "1"
Solution().getPermutation(3, 5) == "312"
Solution().getPermutation(3, 6) == "321"
Solution().getPermutation(4, 7) == "2134"
Solution().getPermutation(5, 15) == "14325"
Solution().getPermutation(9, 6) == "123456987"
Solution().getPermutation(9, 15) == "123458769"