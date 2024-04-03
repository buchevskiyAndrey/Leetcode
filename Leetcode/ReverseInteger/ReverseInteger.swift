//
//  ReverseInteger.swift
//  Leetcode
//
//  Created by Бучевский Андрей on 22.03.2024.
//

import Foundation

// 7. Reverse Integer
// Given a signed 32-bit integer x, return x with its digits reversed.
// If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
//
// Assume the environment does not allow you to store 64-bit integers (signed or unsigned).
//
//
//
// Example 1:
//
//Input: x = 123
//Output: 321
//Example 2:
//
//Input: x = -123
//Output: -321

func reverse(_ x: Int) -> Int {
    var x = x
    var reversed = 0
    while x != 0 {
        reversed = (reversed * 10) + (x % 10)
        x /= 10
    }
    return reversed < Int32.min || reversed > Int32.max ? 0 : reversed
}
