/*
 Say you have an array for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times) with the following restrictions:

 - You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 - After you sell your stock, you cannot buy stock on next day. (ie, cooldown 1 day)
 Example:

 ```
 prices = [1, 2, 3, 0, 2]
 maxProfit = 3
 transactions = [buy, sell, cooldown, buy, sell]
 ```

 Credits:
 Special thanks to @dietpepsi for adding this problem and creating all test cases.
*/

// Reference: https://leetcode.com/discuss/71354/share-my-thinking-process
class Solution {
  func maxProfit(prices: [Int]) -> Int {
    var sell = 0
    var preSell = 0
    var buy = Int.min
    var preBuy = Int.min
    for price in prices {
      preBuy = buy
      buy = max(preSell - price, preBuy)
      preSell = sell
      sell = max(preBuy + price, preSell)
    }
    return sell
  }
}

Solution().maxProfit([3,1,2]) == 1
Solution().maxProfit([2,6,8,7,8,7,9,4,1,2,4,5,8]) == 15
Solution().maxProfit([6,1,6,4,3,0,2]) == 7
Solution().maxProfit([1,2,4,2,5,7,2,4,9,0,4]) == 11
Solution().maxProfit([1,2,4,2,5,7,2,4,9,0,9]) == 15
Solution().maxProfit([6,1,3,2,4,7]) == 6
Solution().maxProfit([0,1,3,2,4,7]) == 7
Solution().maxProfit([1,2,3,0,2]) == 3
Solution().maxProfit([1,2,3,0]) == 2
Solution().maxProfit([1,9,10,20]) == 19
Solution().maxProfit([10,30,1,10]) == 20
Solution().maxProfit([1,2,3,2,5,8,4,20]) == 20
Solution().maxProfit([10,5,3,20,11,25]) == 22
Solution().maxProfit([1,4,9,0,0,3,0,0,3]) == 14
Solution().maxProfit([8,7,6,5,4,3,2,1]) == 0
Solution().maxProfit([3,7,6,5,4,3,2,1]) == 4