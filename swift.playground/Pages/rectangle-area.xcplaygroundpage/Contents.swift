/* 
 Find the total area covered by two rectilinear rectangles in a 2D plane.

 Each rectangle is defined by its bottom left corner and top right corner as shown in the figure.

 ![](../../Resources/rectangle_area.png)

 Rectangle Area Assume that the total area is never beyond the maximum possible value of int.

 Credits: Special thanks to @mithmatt for adding this problem, creating the above image and all test cases.
*/

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