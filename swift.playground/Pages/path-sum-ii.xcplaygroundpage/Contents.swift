/*
 Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.

 For example:
 Given the below binary tree and sum = 22,
 
 ```
       5
      / \
     4   8
    /   / \
   11  13  4
  /  \    / \
 7    2  5   1
 ```

 5, 4, 8, 11, null, 13, 4, 7, 2, null, null, 5, 1

 return
 
 ```
 [
  [5,4,11,2],
  [5,8,4,5]
 ]
 ```
*/

import Foundation

class Solution {
  func pathSum(root: TreeNode?, _ sum: Int) -> [[Int]] {
    guard root != nil else { return [] }

    var paths = [[Int]]()

    if root?.left == nil && root?.right == nil && root?.val == sum {
      return [[root!.val]]
    }

    paths += pathSum(root?.left, sum - root!.val)
    paths += pathSum(root?.right, sum - root!.val)

    for i in 0..<paths.count {
      paths[i].insert(root!.val, atIndex: 0)
    }
    return paths
  }
}

//   5
//  / \
// 1   1

String(Solution().pathSum(makeBTree([5,1,1]), 6)) == String([[5,1],[5,1]])
String(Solution().pathSum(makeBTree([5,4,8,11,nil,13,4,7,2,nil,nil,5,1]), 22)) == String([[5,4,11,2],[5,8,4,5]])
String(Solution().pathSum(makeBTree([-2,nil,-3]), -5)) == String([[-2,-3]])
