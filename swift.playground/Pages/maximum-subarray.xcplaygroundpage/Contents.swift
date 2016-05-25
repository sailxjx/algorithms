/*
 Find the contiguous subarray within an array (containing at least one number) which has the largest sum.

 For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
 the contiguous subarray [4,−1,2,1] has the largest sum = 6.

 More practice:
 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 */

class Solution {
  func maxSubArray(nums: [Int]) -> Int {
    var lastSum = nums[0]
    var maxSum = nums[0]
    for i in 1..<nums.count {
      lastSum = max(lastSum + nums[i], nums[i])
      maxSum = max(maxSum, lastSum)
    }
    return maxSum
  }
}

Solution().maxSubArray([1]) == 1
Solution().maxSubArray([-2,1,-3,4]) == 4
Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4]) == 6