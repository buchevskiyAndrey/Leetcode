//
//  FindMedianSortedArrays.swift
//  Leetcode
//
//  Created by Бучевский Андрей on 21.02.2024.
//

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let isNumbered = ((nums1.count + nums2.count) % 2) == 0
    let middle = (Double(nums1.count + nums2.count) / 2.0).rounded()
    var p1 = 0
    var p2 = 0
    var combinedArray: [Int] = []

    while Double(combinedArray.count) != (isNumbered ? (middle + 1) : middle) {
        if p2 < nums2.count && (p1 >= nums1.count || nums1[p1] > nums2[p2]) {
            combinedArray.append(nums2[p2])
            p2 += 1
        } else {
            combinedArray.append(nums1[p1])
            p1 += 1
        }
    }

    if isNumbered {
        return ((Double(combinedArray.popLast() ?? 0)) + Double(combinedArray.popLast() ?? 0)) / 2.0
    } else {
        return Double(combinedArray.last ?? 0)
    }
}
