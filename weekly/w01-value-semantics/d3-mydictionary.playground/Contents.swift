import Foundation


struct MyDictionary<Key: Hashable, Value> {
    // MARK: Types
    private struct Slot {
        var key: Key
        var value: Value
    }
    
    private typealias Bucket = [Slot]
    
    // MARK: Properties
    private var buckets: [Bucket]
    private(set) var count = 0
    
    init(capacity: Int = 16) {
        let capacity = max(16, capacity)
        self.buckets = Array(repeating: [], count: capacity)
    }
    
    private func bucketIndex(forKey key: Key,in count: Int) -> Int {
        abs(key.hashValue) % count
    }
    
    subscript(key: Key) -> Value? {
        // How do we return an element from the hash map
        get {
            let bucketIndex = bucketIndex(forKey: key, in: buckets.count)
            let bucket = buckets[bucketIndex]
            let slot = bucket.first(where: { $0.key == key })
            return slot?.value
        }
        
        // How do we set an element to the hash map
        set {
            // we have to find the slot index of where to set it
            let bucketIndex = bucketIndex(forKey: key, in: buckets.count)
            // now, in for this index, we can have different scenarios
            // 1. We might not find any slot for this bucket -> Empty Bucket
            // 2. The bucket might not be empty -> We are already using the hash % count index, so we have to search throug the keys
            // 2 a. If the key exists, we update the value, otherwise, we assign int to the list
            if let slotIndex = buckets[bucketIndex].firstIndex(where: { $0.key == key }) {
                // we found that the slot is taken
                if let newValue {
                    // if there's a new value, then let's update the hash map's value
                    buckets[bucketIndex][slotIndex].value = newValue
                } else {
                    // This means that the value that was provided is nil
                    buckets[bucketIndex].remove(at: slotIndex)
                    count -= 1
                }
                return
            }
            
            // There's no slot taken, we have to create it and update
            if let newValue {
                buckets[bucketIndex].append(Slot(key: key, value: newValue))
                count += 1
                // this is the trick, to reize
                if count > buckets.count {
                    resize()
                }
            }
            
        }
        
    }
    
    private mutating func resize() {
        let oldBuckets = buckets
        buckets = Array(repeating: [], count: oldBuckets.count * 2)
        count = 0
        for oldBucket in oldBuckets {
            for slot in oldBucket {
                self[slot.key] = slot.value
            }
        }
    }
}


// Now let's run some tests
var dict = MyDictionary<String, Int>()
dict["one"] = 1
dict["two"] = 2

print(dict["one"] ?? -1)
print(dict["two"] ?? -1)
print(dict["three"] ?? -1)

dict["two"] = 22
print(dict["two"] ?? -1)
print(dict.count)









struct MyNewDictionary<Key: Hashable, Value> {
    // MARK: - Types
    private struct Slot {
        var key: Key
        var value: Value
    }
    
    private typealias Bucket = [Slot]
    
    // MARK: - State
    private var buckets: [Bucket]
    private(set) var count = 0
    
    init(capacity: Int = 16) {
        let capacity = max(capacity, 16)
        self.buckets = Array(repeating: [], count: capacity)
    }
    
    subscript(key: Key) -> Value? {
        get {
            let bucketIndex = bucketIndex(forKey: key, count: buckets.count)
            let bucket = buckets[bucketIndex]
            let slot = bucket.first(where: { $0.key == key })
            return slot?.value
        }
        
        set {
            let bucketIndex = bucketIndex(forKey: key, count: buckets.count)
            
            // have a slot for the bucket Index
            if let slotIndex = buckets[bucketIndex].firstIndex(where: { $0.key == key }) {
                if let newValue {
                    // we have a new entrance so we are updating the value
                    buckets[bucketIndex][slotIndex].value = newValue
                } else {
                    // new value is nil
                    buckets[bucketIndex].remove(at: slotIndex)
                    count -= 1
                }
                return
            }
            
            // I have a empty bucket, I have to append the slot
            if let newValue {
                buckets[bucketIndex].append(Slot(key: key, value: newValue))
                count += 1
                
                // let's verify the hash maps capacity
                if count > buckets.count {
                    // trigger resize
                    resize()
                }
            }
        }
        
    }
    
    // MARK: - Helpers
    private func bucketIndex(forKey key: Key, count: Int) -> Int {
        abs(key.hashValue) % count
    }
    
    private mutating func resize()  {
        // let's double the capacity
        // copy the old buckets
        let oldBuckets = buckets
        buckets = Array(repeating: [], count: buckets.count * 2)
        count = 0 // Don't forget to reset the cout
        for bucket in oldBuckets {
            for slot in bucket {
                self[slot.key] = slot.value
            }
        }
        
    }
}
