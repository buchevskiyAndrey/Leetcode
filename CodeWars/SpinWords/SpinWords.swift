//
//  SpinWords.swift
//  Leetcode
//
//  Created by Бучевский Андрей on 22.02.2024.
//

// https://www.codewars.com/kata/5264d2b162488dc400000001/swift
//
// Stop gninnipS My sdroW!
//Write a function that takes in a string of one or more words, and returns the same string, but with all words that have five or more letters reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.
//
//Examples:
//
//"Hey fellow warriors"  --> "Hey wollef sroirraw"
//"This is a test        --> "This is a test"
//"This is another test" --> "This is rehtona test"

func spinWords(in sentence: String) -> String {
    guard !sentence.isEmpty && sentence.count >= 5 else {
        return sentence
    }

    guard let whitespaceIndex = sentence.firstIndex(of: " ") else {
        return String(sentence.reversed())
    }

    let res: String
    let distance = sentence.distance(from: sentence.startIndex, to: whitespaceIndex)

    if distance >= 5 {
        res = String(sentence[sentence.startIndex...sentence.index(before: whitespaceIndex)].reversed())
    } else {
        res = String(sentence[sentence.startIndex...sentence.index(before: whitespaceIndex)])
    }

    return res + " " + spinWords(in: String(sentence[sentence.index(after: whitespaceIndex)...sentence.index(before: sentence.endIndex)]))
}
