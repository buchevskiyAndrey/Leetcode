//
//  LongestPalindrom.swift
//  Leetcode
//
//  Created by Бучевский Андрей on 06.03.2024.
//

// 5. Longest Palindromic Substring
//
// Given a string s, return the longest palindromic substring in s.
//
//Example 1:
//
//Input: s = "babad"
//Output: "bab"
//Explanation: "aba" is also a valid answer.
//Example 2:
//
//Input: s = "cbbd"
//Output: "bb"

func longestPalindrome(_ s: String) -> String {
    let length = s.count
    guard length > 1 else { return s }
    let arr = Array(s)
    var db = Array(repeating: Array(repeating: false, count: length), count: length)
    var rhs = 0
    var lhs = 0
    
    for rightPointer in 1..<length {
        for leftPointer in 0..<rightPointer {
            if arr[leftPointer] == arr[rightPointer] && ((rightPointer-leftPointer) <= 2 || db[rightPointer-1][leftPointer+1]) {
                db[rightPointer][leftPointer] = true
                if rightPointer - leftPointer > rhs - lhs {
                    rhs = rightPointer
                    lhs = leftPointer
                }
            }
        }
    }
    
    return String(s[s.index(s.startIndex, offsetBy: lhs)...s.index(s.startIndex, offsetBy: rhs)])
}
