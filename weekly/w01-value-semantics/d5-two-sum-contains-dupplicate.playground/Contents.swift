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
