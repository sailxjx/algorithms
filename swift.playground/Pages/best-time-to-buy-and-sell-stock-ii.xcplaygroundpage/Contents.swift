/*
 Say you have an array for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times). However, you may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
*/

class Solution {
  func maxProfit(prices: [Int]) -> Int {
    var profit = 0
    guard prices.count > 1 else { return 0 }
    for i in 0..<prices.count - 1 {
      profit += max(prices[i + 1] - prices[i], 0)
    }
    return profit
  }
}

Solution().maxProfit([]) == 0
Solution().maxProfit([1]) == 0
Solution().maxProfit([1,2,3,0,2]) == 4
Solution().maxProfit([1,9,10,20]) == 19
Solution().maxProfit([10,30,1,10]) == 29
Solution().maxProfit([1,2,3,2,5,8,4,20]) == 24
Solution().maxProfit([10,5,3,20,11,25]) == 31