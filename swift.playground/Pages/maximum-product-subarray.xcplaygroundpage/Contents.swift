/*
 Find the contiguous subarray within an array (containing at least one number) which has the largest product.

 For example, given the array [2,3,-2,4],
 the contiguous subarray [2,3] has the largest product = 6.
 */

class Solution {
  func maxProduct(nums: [Int]) -> Int {
    var maxResult = Int.min
    var positiveBase = 1
    var negativeBase = 1
    for num in nums {
      maxResult = max(maxResult, positiveBase * num, negativeBase * num, num)
      if num == 0 {
        positiveBase = 1
        negativeBase = 1
      } else if num > 0 {
        let positive = max(positiveBase * num, num)
        let negative = min(negativeBase * num, num)
        positiveBase = positive
        negativeBase = negative
      } else if num < 0 {
        let positive = max(negativeBase * num, num)
        let negative = min(positiveBase * num, num)
        positiveBase = positive
        negativeBase = negative
      }
    }
    return maxResult
  }
}

// -2 -6
//     3

Solution().maxProduct([0]) == 0
Solution().maxProduct([0,1,2]) == 2
Solution().maxProduct([0,1,-2]) == 1
Solution().maxProduct([0,1,0,2,-2]) == 2
Solution().maxProduct([-2]) == -2
Solution().maxProduct([2,3,-2,4]) == 6
Solution().maxProduct([-2,3,-2,4]) == 48
Solution().maxProduct([-2,3,-2,-4]) == 24
Solution().maxProduct([2,-2,3,-4,-2,4]) == 96
Solution().maxProduct([2,-2,-3,-4,-2,4]) == 384
Solution().maxProduct([2,-2,-3,-4,-2]) == 96
Solution().maxProduct([2,-2,-3,-4]) == 12