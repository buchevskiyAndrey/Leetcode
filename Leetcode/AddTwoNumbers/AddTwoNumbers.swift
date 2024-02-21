//
//  AddTwoNumbers.swift
//  Leetcode
//
//  Created by Бучевский Андрей on 18.02.2024.
//

//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//Input: l1 = [2,4,3], l2 = [5,6,4]
//Output: [7,0,8]
//Explanation: 342 + 465 = 807.


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1
    var l2 = l2
    var leftover = 0
    var currentNode = ListNode()
    let head = currentNode

    while l1 != nil || l2 != nil || leftover != 0 {
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + leftover
        l1 = l1?.next
        l2 = l2?.next
        leftover = sum / 10
        let newNode = ListNode(sum % 10)
        currentNode.next = newNode
        currentNode = newNode
    }

    return head.next
}
