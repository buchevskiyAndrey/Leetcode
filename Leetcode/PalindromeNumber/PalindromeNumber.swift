//
//  PalindromeNumber.swift
//  Leetcode
//
//  Created by Бучевский Андрей on 03.04.2024.
//

// 9. Palindrome Number
//
//Given an integer x, return true if x is a palindrome, and false otherwise.
//
//Example 1:
//
//Input: x = 121
//Output: true
//Explanation: 121 reads as 121 from left to right and from right to left.
//
//Example 2:
//
//Input: x = -121
//Output: false
//Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
//
//Example 3:
//
//Input: x = 10
//Output: false
//Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
//

func isPalindrome(_ x: Int) -> Bool {
    if x < 0 || (x % 10 == 0 && x != 0){
        return false
    }

    if x >= 0 && x < 10 {
        return true
    }

    var reversedNumber = 0

    var tempX = x

    while tempX > 0 {
        reversedNumber = reversedNumber * 10 + tempX % 10
        tempX = tempX / 10
    }
    return reversedNumber == x
}
