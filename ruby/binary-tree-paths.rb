# Given a binary tree, return all root-to-leaf paths.
#
# For example, given the following binary tree:
#
#    1
#  /   \
# 2     3
#  \
#   5
# All root-to-leaf paths are:
#
# ["1->2->5", "1->3"]
# Credits:
# Special thanks to @jianchao.li.fighter for adding this problem and creating all test cases.

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {String[]}
def binary_tree_paths(root)
  return [] unless root
  return ["#{root.val}"] unless root.left or root.right
  paths = []
  [root.left, root.right].each do |node|
    if node
      binary_tree_paths(node).each do |path|
        paths += ["#{root.val}->#{path}"]
      end
    end
  end
  paths
end

#    1
#  /   \
# 2     3
#  \
#   5
v1 = TreeNode.new 1
v2 = TreeNode.new 2
v3 = TreeNode.new 3
v5 = TreeNode.new 5
v1.left = v2
v1.right = v3
v2.right = v5

p binary_tree_paths(v1) == ['1->2->5', '1->3']
