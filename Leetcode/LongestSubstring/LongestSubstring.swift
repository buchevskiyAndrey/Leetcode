//
//  LongestSubstring.swift
//  Leetcode
//
//  Created by Бучевский Андрей on 18.02.2024.
//

// 3. Longest Substring Without Repeating Characters
//
// Given a string s, find the length of the longest
//substring
// without repeating characters.
//
//
//
//Example 1:
//
//Input: s = "abcabcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.

func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxLength = 0
    var listOfCharactersWithoutRepetition: [Character] = []

    s.forEach {
        if let index = listOfCharactersWithoutRepetition.firstIndex(of: $0) {
            listOfCharactersWithoutRepetition.removeFirst(index + 1)
        }
        listOfCharactersWithoutRepetition.append($0)
        maxLength = max(listOfCharactersWithoutRepetition.count, maxLength)
    }
    return maxLength
}
