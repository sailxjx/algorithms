/*
 Given a binary tree, find its maximum depth.

 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 */

import Foundation

class Solution {
  func maxDepth(root: TreeNode?) -> Int {
    guard root != nil else { return 0 }
    return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
  }
}

Solution().maxDepth(makeBTree([1,2,3])) == 2
Solution().maxDepth(makeBTree([-2,nil,-3,3])) == 3