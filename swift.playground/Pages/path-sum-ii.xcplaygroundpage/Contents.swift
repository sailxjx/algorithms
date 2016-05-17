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


/**
 * Definition for a binary tree node.
 */
public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?

  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }

  func setLeft(node: TreeNode) -> TreeNode {
    left = node
    return self
  }

  func setRight(node: TreeNode) -> TreeNode {
    right = node
    return self
  }
}

func makeBTree(treeValues: [Int?]) -> TreeNode {
  var bTree = [TreeNode?]()
  var treeValues = treeValues
  let root = TreeNode(treeValues.removeFirst()!)
  bTree.append(root)

  while treeValues.count > 0 {
    let i = bTree.count
    let pIdx = Int(floor(Double((i + 1) / 2))) - 1
    if bTree[pIdx] == nil {  // Parent node is empty
      bTree.append(nil)
    } else {
      let val = treeValues.removeFirst()
      if val == nil {
        bTree.append(nil)
      } else {
        bTree.append(TreeNode(val!))
      }
    }
  }

  for (i, node) in bTree.enumerate() {
    let leftIdx = i * 2 + 1
    let rightIdx = leftIdx + 1
    if leftIdx < bTree.count && bTree[leftIdx] != nil {
      node?.left = bTree[leftIdx]
    }
    if rightIdx < bTree.count && bTree[rightIdx] != nil {
      node?.right = bTree[rightIdx]
    }
  }
  return root
}

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