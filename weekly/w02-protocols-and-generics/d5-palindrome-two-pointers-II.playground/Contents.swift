import Foundation

func isPalindrome(_ s: String) -> Bool {
    // strip the non alphanumeric
    // lowercase the elements as we compare to gain some perf
    // use the two pointers solution
    let lowerCased = Array(s.lowercased().filter{ $0.isLetter || $0.isNumber })
    guard lowerCased.count > 1 else { return true }
    
    var left = 0
    var right = lowerCased.count - 1
    
    while left < right {
        if lowerCased[left] == lowerCased[right] {
            left += 1
            right -= 1
        } else {
            return false
        }
    }
    
    return true
}

isPalindrome(" ")
isPalindrome("race a car")
isPalindrome("A man, a plan, a canal: Panama")
