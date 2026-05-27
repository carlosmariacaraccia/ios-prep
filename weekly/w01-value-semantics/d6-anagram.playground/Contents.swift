import Foundation

// restate in own words:
// We have to compare both words and see if they have the exact same letters
// I don't know about the brute force solution, but I'm assuming that if I'm in
// an anagram both words have the same number of letters. If so then we can
// just loop through the length of any word (O(N) intead of both O(N^2)).
// Now, With a hashTable I can store the letter and the number of occurrences,
// so if there's an occurrence for word a I'll add 1 and if it is for word b
// then I'll remove 1. If the count is 0 at the end then
// we found the anagram, other wise we did not.

func isAnagram(s: String, t: String) -> Bool {
    // asume that both words have the same lenght and
    // that they contain more than one character
    guard s.count == t.count,
          s.count > 0 else { return false }
    
    let wordsIndices = s.indices
    var characterOccurrences = [String: Int]()
    
    // Instead of looping through
    for currentIndex in wordsIndices {
        let charOfWordA = s[currentIndex]
        let charOfWordB = t[currentIndex]
        
        characterOccurrences["\(charOfWordA)", default: 0] += 1
        characterOccurrences["\(charOfWordB)", default: 0] -= 1
    }
    
    for occurrence in characterOccurrences.values {
        if occurrence != 0 {
            return false
        }
    }
    
    return true
}

print(isAnagram(s: "anagram", t: "nagaram"))   // predict: ?
print(isAnagram(s: "rat", t: "car"))           // predict: ?
print(isAnagram(s: "a", t: "ab"))              // predict: ?
print(isAnagram(s: "", t: ""))                 // predict: ?
print(isAnagram(s: "aaab", t: "abbb"))         // predict: ?


func groupAnagram(_ s: [String]) -> [[String]] {
    // let's asume there must be 2 or more words to be grouped
    guard s.count > 1 else { return [] }
        
    // Hash map that will hold the
    // the idea is to have a key that will be the same for all the
    // words. If I find that key, then I'll append it to the list of strings
    // that will be holding the anagarms dictionary["anagramKey"] = [String]
    // Then I will be returning all the values of the dictionary.
    // I will be looping through the list only once so the solution will be O(N).
    // First milestone is to find the key. All anagrams have the same number of
    // chars, this is a4b5s2. So they should be all decapitalized to be comparing
    // the same, also then they should be sorted aphabetically to compare the same
    // keys
    
    var groupedWordsByKeys = [String: [String]]()
    
    for word in s {
        let key = String(word.lowercased().sorted())
        groupedWordsByKeys[key, default: []].append(word)
    }
    
    return Array(groupedWordsByKeys.values)
}


print(groupAnagram(["eat","tea","tan","ate","nat","bat"]))  // predict?
print(groupAnagram([""]))                                    // predict?
print(groupAnagram(["a"]))                                   // predict?
