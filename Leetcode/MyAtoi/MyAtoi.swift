//
//  MyAtoi.swift
//  Leetcode
//
//  Created by Бучевский Андрей on 26.03.2024.
//

//  8. String to Integer (atoi)
//Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).
//
//The algorithm for myAtoi(string s) is as follows:
//
//Read in and ignore any leading whitespace.
//Check if the next character (if not already at the end of the string) is '-' or '+'. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
//Read in next the characters until the next non-digit character or the end of the input is reached. The rest of the string is ignored.
//Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
//If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater than 231 - 1 should be clamped to 231 - 1.
//Return the integer as the final result.
//Note:
//
//Only the space character ' ' is considered a whitespace character.
//Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.
//
//
//Example 1:
//
//Input: s = "42"
//Output: 42
//Explanation: The underlined characters are what is read in, the caret is the current reader position.
//Step 1: "42" (no characters read because there is no leading whitespace)


func myAtoi(_ s: String) -> Int {
    let str = s.trimmingCharacters(in: .whitespaces)
    guard !str.isEmpty else { return 0 }

    var result: Int = 0
    var sign = 1
    var index = str.startIndex

    if str[index] == "+" {
        sign = 1
        index = str.index(after: index)
    } else if str[index] == "-" {
        sign = -1
        index = str.index(after: index)
    }

    while index < str.endIndex && str[index].isNumber {
        let number = Int(String(str[index]))!

        if result > (Int(Int32.max) - number) / 10 {
            return sign == 1 ? Int(Int32.max) : Int(Int32.min)
        }

        result = result * 10 + number
        index = str.index(after: index)
    }

    return result * sign
}
