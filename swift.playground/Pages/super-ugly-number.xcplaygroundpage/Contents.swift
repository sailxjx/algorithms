/*
 Write a program to find the n^th super ugly number.

 Super ugly numbers are positive numbers whose all prime factors are in the given prime list primes of size k. For example, [1, 2, 4, 7, 8, 13, 14, 16, 19, 26, 28, 32] is the sequence of the first 12 super ugly numbers given primes = [2, 7, 13, 19] of size 4.

 Note:

 - (1) 1 is a super ugly number for any given primes.
 - (2) The given numbers in primes are in ascending order.
 - (3) 0 < k ≤ 100, 0 < n ≤ 106, 0 < primes[i] < 1000.

 Credits: Special thanks to @dietpepsi for adding this problem and creating all test cases.
*/

// Reference: https://leetcode.com/discuss/72835/108ms-easy-to-understand-java-solution

class Solution {
  func nthSuperUglyNumber(n: Int, _ primes: [Int]) -> Int {
    var results = [Int](count: n, repeatedValue: 0)
    var indexes = [Int](count: primes.count, repeatedValue: 0)
    results[0] = 1

    for i in 1..<n {
      results[i] = Int.max

      for j in 0..<primes.count {
        results[i] = min(results[i], primes[j] * results[indexes[j]])
      }

      for j in 0..<indexes.count {
        if results[i] == primes[j] * results[indexes[j]] {
          indexes[j] += 1
        }
      }
    }

    return results[n - 1]
  }
}

Solution().nthSuperUglyNumber(1, [2, 3, 5]) == 1
Solution().nthSuperUglyNumber(5, [2, 3, 5]) == 5
Solution().nthSuperUglyNumber(7, [2, 3, 5]) == 8
Solution().nthSuperUglyNumber(12, [2, 7, 13, 19]) == 32
Solution().nthSuperUglyNumber(81, [2, 3, 7, 13, 19]) == 351