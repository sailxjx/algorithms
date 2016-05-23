import Foundation

/**
 * Definition for a binary tree node.
 */
public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?

  init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
}

/**
 * Return a binary tree by an array of values
 */
public func makeBTree(treeValues: [Int?]) -> TreeNode {
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