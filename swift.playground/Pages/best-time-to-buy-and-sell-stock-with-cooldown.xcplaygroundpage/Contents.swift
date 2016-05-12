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

class Solution {
  func maxProfit(prices: [Int]) -> Int {
//    var min = -1  // Never buyed
//    var profit = 0
//    var gained = 0
//    var cooldown = false
//    let priceCount = prices.count
//    for i in 0..<priceCount {
//      // Last two prices
//      let today = prices[i]
//      let tomorrow = prices[i + 1]
//      let dayAfterTomorrow = prices[i + 2]
//      if min == -1 {  // Try buy
//        if cooldown {  // Skip cooldown
//          cooldown = false
//          continue
//        }
//        if dayAfterTomorrow >= today {
//          min = today  // Buy
//        } else {
//
//        }
//        if tomorrow >= today && dayAfterTomorrow >= tomorrow {
//          min = today  // Buy
//        } else if tomorrow >= today && dayAfterTomorrow < tomorrow {
//
//        }
//      } else {  // Try sell
//        cooldown = true
//        min = -1
//      }
//      if tomorrow > today && dayAfterTomorrow > tomorrow && today < min && cooldown == false {
//        min = today
//      }
//      if cur < min && colldown == false {  // Buy
//        min = cur
//      }
//    }
//    for price in prices {
//      if price < min {
//        min = price
//      } else {
//        let diff = price - min
//        profit = diff > profit ? diff: profit
//      }
//    }
//    return profit
    return 0
  }

  func maxProfitWithoutCooldown(prices: [Int]) -> Int {
    var min = -1
    var profit = 0
    let count = prices.count
    for i in 0..<count {
      let today = prices[i]
      if min == -1 {  // Try buy
        if count - i > 1 {  // Exist tomorrow
          if prices[i + 1] > today {
            min = today  // Buy
          }
        }
      } else {  // Try sell
        if count - 1 > 1 {  // Exist tomorrow
          if prices[i + 1] < today {
            profit = today - min  // Sell
            min = -1
          }
        }
      }
    }
    return profit
  }
}

//Solution().maxProfit([1,2,3,0,2]) == 3
//Solution().maxProfit([1,9,10,20]) == 19
//Solution().maxProfit([10,30,1,10]) == 20
//Solution().maxProfit([1,2,3,2,5,8,4,20]) == 20
//Solution().maxProfit([10,5,3,20,11,25]) == 22