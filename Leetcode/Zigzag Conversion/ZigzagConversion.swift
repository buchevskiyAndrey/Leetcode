//
//  ZigzagConversion.swift
//  Leetcode
//
//  Created by Бучевский Андрей on 15.03.2024.
//

// 6. Zigzag Conversion
//
//The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
//
//P   A   H   N
//A P L S I I G
//Y   I   R
//And then read line by line: "PAHNAPLSIIGYIR"
//
//Write the code that will take a string and make this conversion given a number of rows:
//
//string convert(string s, int numRows);
//
//
//Example 1:
//
//Input: s = "PAYPALISHIRING", numRows = 3
//Output: "PAHNAPLSIIGYIR"

func convert(_ s: String, _ numRows: Int) -> String {
    if numRows == 1 || numRows >= s.count { return s }
    
    var dp = Array(repeating: "", count: numRows)
    let distance = numRows * 2 - 2
    var pointer = 0
    
    for character in s {
        if pointer < numRows {
            dp[pointer].append(String(character))
        } else {
            dp[distance-pointer].append(String(character))
        }
        
        if pointer < distance {
            pointer += 1
        } else {
            pointer = 1
        }
    }
    
    return dp.joined()
}

