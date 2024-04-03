//
//  SumBigArrays.swift
//  Leetcode
//
//  Created by Бучевский Андрей on 21.02.2024.
//

// Мы хотим складывать очень большие числа, которые превышают емкость базовых типов, поэтому мы храним их в виде массива неотрицательных чисел.
// Нужно написать функцию, которая примет на вход два таких массива, вычислит сумму чисел, представленных массивами, и вернет результат в виде такого же массива.
//
// # Пример 1
// # ввод
// arr1 = [1, 2, 3] # число 123
// arr2 = [4, 5, 6] # число 456
// # вывод
// res = [5, 7, 9] # число 579. Допустим ответ с первым незначимым нулем [0, 5, 7, 9]

// # Пример 2
// # ввод
// # ввод
// arr1 = [5, 4, 4] # число 544
// arr2 = [4, 5, 6] # число 456
// # вывод
// res = [1, 0, 0, 0] # число 1000

func sumBigArrays(arr1: [Int], arr2: [Int]) -> [Int] {
    var res: [Int] = []
    var p1 = arr1.count - 1
    var p2 = arr2.count - 1
    var leftover = 0

    while p1 >= 0 && p2 >= 0 {
        let sum = (p1 < 0 ? 0 : arr1[p1]) + (p2 < 0 ? 0 : arr2[p2]) + leftover
        res.append(sum % 10)
        leftover = sum / 10
        p1 -= 1
        p2 -= 1
    }

    if leftover > 0 {
        res.append(leftover)
    }

    return res.reversed()
}