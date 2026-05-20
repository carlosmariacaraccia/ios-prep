import Foundation

// search for a value an an array if the value is found then return true, otherwise return false
// brute force solution, two indices, two nested for loops and then search through the array if the element 
// is repeated then I'll return true

// the key is not to go through the whole collection every single time
// we should have a hash table indicating with the key the value of the array and the value of the hash table will
// be the number of occurrences, we have to evaluate the dict, every time we add an entrance and if the any of the
// values is 2 then we should exit the loop.


func containsDuplicate(_ integerList: [Int]) -> Bool? {
    guard integerList.count > 1 else { 
        return nil
    }

    var occurrences = [Int: Bool]()
    var leftIndex = 0
    var rightIndex = integerList.count - 1
    // lets cycle the collection only from one side
    while leftIndex <= rightIndex { 
        rightIndex = integerList.count - leftIndex
        let leftValue = integerList[leftIndex]
        let rightValue = integerList[rightIndex]
        print(leftValue)
        print(rightValue)
        if leftValue == rightValue { 
            if occurrences[leftValue] != nil { // I already have an entrance
                return true
            } else { // I don't have any entrance
                occurrences[leftValue] = true
            }
        }

        leftIndex += 1
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