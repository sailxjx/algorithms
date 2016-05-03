//: Playground - noun: a place where people can play

class Solution {
  func computeArea(A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
    let total = (C - A) * (D - B) + (G - E) * (H - F)
    if A > G || B > H || E > C || F > D {
      return total
    }
    let nA = max(A, E)
    let nB = max(B, F)
    let nC = min(C, G)
    let nD = min(D, H)
    let area = total - (nC - nA) * (nD - nB)
    return area
  }
}

Solution().computeArea(-3, 0, 3, 4, 0, -1, 9, 2) == 45
Solution().computeArea(-3, -2, 0, 2, -2, -3, 3, 3) == 34
Solution().computeArea(-2, -2, 2, 2, -1, -1, 1, 1) == 16
Solution().computeArea(-2, -2, 0, 0, 0, 0, 2, 2) == 8
Solution().computeArea(-10, 20, 20, 30, -30, -14, 50, 20) == 3020
Solution().computeArea(-2, -2, 2, 2, -2, -2, 2, 2) == 16