class ListNode {
    var val: Int
    var next: ListNode?
    init() {
        val = 0
        next = nil
    }
    init(_ val: Int) {
        self.val = val
        next = nil
    }
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

let l1 = ListNode()
let l2 = ListNode()
l1.val = 2
l1.next = ListNode(4)
l1.next?.next = ListNode(3)

l2.val = 5
l2.next = ListNode(6)
l2.next?.next = ListNode(4)

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var carry = 0
        let dummy = ListNode()
        var current: ListNode? = dummy

        while l1 != nil || l2 != nil {
            let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            carry = sum / 10
            current?.next = ListNode(sum % 10)
            current = current?.next
            l1 = l1?.next
            l2 = l2?.next
        }

        if carry > 0 {
            current?.next = ListNode(carry)
        }

        return dummy.next
    }
}

var l3 = Solution().addTwoNumbers(l1, l2)
var a = [Int]()
while l3 != nil {
    a.append(l3?.val ?? 0)
    l3 = l3?.next
}
print(a) // [7, 0, 8]

/*
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.



Example 1:


Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.
Example 2:

Input: l1 = [0], l2 = [0]
Output: [0]
Example 3:

Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]


Constraints:

The number of nodes in each linked list is in the range [1, 100].
0 <= Node.val <= 9
It is guaranteed that the list represents a number that does not have leading zeros.
*/