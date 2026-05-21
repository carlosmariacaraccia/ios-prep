import Foundation

func containsDuplicate(_ list: [Int]) -> Bool {
    // if the list does not contains more that one element let's return falst
    guard list.count > 1 else { return false }
    
    var occurrences = Set<Int>()
    
    for value in list {
        if !occurrences.insert(value).0 {
            return true
        }
    }
    return false
}

// Basic — has a duplicate
print(containsDuplicate([1, 2, 3, 1]))                       // expected: true

// Basic — no duplicates
print(containsDuplicate([1, 2, 3, 4]))                       // expected: false

// Multiple duplicates
print(containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]))     // expected: true

// Edge: single element (can't have a duplicate of itself)
print(containsDuplicate([1]))                                // expected: false

// Edge: empty array
print(containsDuplicate([]))                                 // expected: false

// Duplicates far apart
print(containsDuplicate([1, 2, 3, 4, 5, 6, 7, 8, 9, 1]))     // expected: true

// Adjacent duplicates
print(containsDuplicate([1, 1, 2, 3]))                       // expected: true

// All same
print(containsDuplicate([5, 5, 5, 5]))                       // expected: true

// Negative numbers (hash maps care about value, not sign)
print(containsDuplicate([-1, -2, -3, -1]))                   // expected: true

// Large range, no duplicates
print(containsDuplicate([100, -100, 50, -50, 0]))            // expected: false


func twoSumBruteForce(_ intList: [Int], _ target: Int) -> [Int] {
    guard intList.count > 1 else { return [] }
    
    var outerIndex = 0
    var seenIndices = [Int]()
    
    while outerIndex < intList.count - 1 {
        for movingIndex in (outerIndex + 1)...intList.count - 1 {
            if intList[outerIndex] + intList[movingIndex] == target {
                seenIndices.append(outerIndex)
                seenIndices.append(movingIndex)
            }
        }
        outerIndex += 1
    }
    
    return seenIndices
}

func twoSum(_ intList: [Int], _ target: Int) -> [Int] {
    guard intList.count > 1 else { return [] }
    
    // i will store the values that i have seen and the indices
    var seenValues = Dictionary<Int, Int>()
    
    for index in 0..<intList.count {
        let currentValue = intList[index]
        let desiredValue = target - currentValue
        if let indexOfDesiredValue = seenValues[desiredValue] {
            return [indexOfDesiredValue, index]
        } else {
            seenValues[currentValue] = index
        }
    }
    return []
}


print(twoSum([2, 7, 11, 15], 9))   // expected: [0, 1]  (2 + 7 = 9)
print(twoSum([3, 2, 4], 6))        // expected: [1, 2]  (2 + 4 = 6)
print(twoSum([3, 3], 6))           // expected: [0, 1]  (3 + 3 = 6)
print(twoSum([1, 2, 3, 4, 5], 9))  // expected: [3, 4]  (4 + 5 = 9)
print(twoSum([0, 4, 3, 0], 0))     // expected: [0, 3]  (0 + 0 = 0)
print(twoSum([-3, 4, 3, 90], 0))   // expected: [0, 2]  (-3 + 3 = 0)

