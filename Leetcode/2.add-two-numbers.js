/*
 * @lc app=leetcode id=2 lang=javascript
 *
 * [2] Add Two Numbers
 *
 * https://leetcode.com/problems/add-two-numbers/description/
 *
 * algorithms
 * Medium (31.13%)
 * Likes:    5204
 * Dislikes: 1337
 * Total Accepted:    880K
 * Total Submissions: 2.8M
 * Testcase Example:  '[2,4,3]\n[5,6,4]'
 *
 * You are given two non-empty linked lists representing two non-negative
 * integers. The digits are stored in reverse order and each of their nodes
 * contain a single digit. Add the two numbers and return it as a linked list.
 *
 * You may assume the two numbers do not contain any leading zero, except the
 * number 0 itself.
 *
 * Example:
 *
 *
 * Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 * Output: 7 -> 0 -> 8
 * Explanation: 342 + 465 = 807.
 *
 *
 */
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var addTwoNumbers = function(first, second, init, prev = null, carry = 0) {
   if (first == null && second == null && carry === 0) return init || new ListNode(0)

   first = first || { val: 0 }
   second = second || { val: 0 }

   const result = first.val + second.val + carry

   let digit
   if (result >= 10) {
      digit = result - 10
      carry = 1
   } else {
      digit = result
      carry = 0
   }

   const node = new ListNode(digit)
   if (prev) prev.next = node

   return addTwoNumbers(first.next, second.next, init || node, node, carry)
}
