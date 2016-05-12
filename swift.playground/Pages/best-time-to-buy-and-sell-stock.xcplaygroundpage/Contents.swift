/*
 Say you have an array for which the ith element is the price of a given stock on day i.

 If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.
*/

class Solution {
  func maxProfit(prices: [Int]) -> Int {
    var minPrice = Int.max
    var profit = 0
    for price in prices {
      minPrice = min(price, minPrice)
      profit = max(price - minPrice, profit)
    }
    return profit
  }
}

Solution().maxProfit([1,2,3,2,5,8,4,20]) == 19
Solution().maxProfit([10,5,3,20,11,25]) == 22
Solution().maxProfit([1,9,10,20]) == 19
Solution().maxProfit([10,30,1,10]) == 20