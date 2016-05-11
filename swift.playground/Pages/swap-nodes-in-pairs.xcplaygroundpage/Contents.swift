/*
 Given a linked list, swap every two adjacent nodes and return its head.

 For example, Given `1->2->3->4`, you should return the list as `2->1->4->3`.

 Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.
*/

class Solution {
  func swapPairs(head: ListNode?) -> ListNode? {
    guard head?.next != nil else { return head }
    let second = head?.next
    let third = second?.next

    second?.next = head
    head?.next = swapPairs(third)

    return second
  }
}

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

class LinkedList {
  var head: ListNode

  init(_ head: ListNode) {
    self.head = head
  }

  func dump() -> [Int] {
    var values = [Int]()
    var head: ListNode? = self.head
    repeat {
      values.append(head!.val)
      head = head!.next
    } while head != nil
    return values
  }
}

let one = ListNode(1)
let two = ListNode(2)
let three = ListNode(3)
let four = ListNode(4)
let five = ListNode(5)

//1->2->3->4->5
one.next = two
two.next = three
three.next = four
four.next = five

LinkedList(one).dump() == [1, 2, 3, 4, 5]

Solution().swapPairs(one)

LinkedList(two).dump() == [2, 1, 4, 3, 5]

//1->2->3->4->5->6->7->8
//2->1->4->3->6->5->7->8
