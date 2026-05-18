import Foundation

// big struct - no custom cow
struct BigStructNaive {
    var data: [Int]
    
    init(size: Int) {
        self.data = Array(0..<size)
    }
    
}

// big struct with explicit cow
final class IntBuffer {
    var data: [Int]
    
    init(_ data: [Int]) {
        self.data = data
    }
    
    func copy() -> IntBuffer {
        IntBuffer(data)
    }
}

struct BigStructWithCow {
    private var buffer: IntBuffer
    
    var data: [Int] {
        buffer.data
    }
    
    init(_ size: Int) {
        self.buffer = IntBuffer(Array(0..<size))
    }
    
    mutating func appen(_ x: Int) {
        if !isKnownUniquelyReferenced(&buffer) {
            buffer = buffer.copy()
        }
        
        buffer.data.append(x)
    }
}

func time(_ label: String, _ block: () -> Void) {
    let start = CFAbsoluteTimeGetCurrent()
    block()
    let elapsed = CFAbsoluteTimeGetCurrent() - start
    print("\(label): \(String(format: "%.4f", elapsed))s")
}

let size = 1_000_000
let copies = 100

time("Naive struct \(copies) no mutation") {
    let original = BigStructNaive(size: size)
    var copiesArray = [BigStructNaive]()
    
    for _ in 0..<copies {
        copiesArray.append(original)
    }
    
    _ = copiesArray
}

time("BigStructWithCow \(copies) no mutation") {
    let original = BigStructWithCow(size)
    var copiesArray = [BigStructWithCow]()
    
    for _ in 0..<copies {
        copiesArray.append(original)
    }
    
    _ = copiesArray
}

time("Naive struct \(copies) with mutation") {
    let original = BigStructNaive(size: size)
    var copiesArray = [BigStructNaive]()
    
    for _ in 0..<copies { 
        var copy = original
        /* 
            a mutation of the original data ( in this case to
            append data to the array that's buffered). Now we
            should see an increase in the time taken to perform the copy
            because is uniquely referenced check will fail and
             the entire array will be copied
        */
        copy.data.append(0) 
        copiesArray.append(copy)
    }
}

time("BigStructWithCow \(copies) with mutation") {
    let original = BigStructWithCow(size)
    var copiesArray = [BigStructWithCow]()
    
    for _ in 0..<copies {
        var copy = original
        /* 
            a mutation of the original data ( in this case to
            append data to the array that's buffered). Now we
            should see an increase in the time taken to perform the copy
            because is uniquely referenced check will fail and
             the entire array will be copied
        */
        copy.appen(0) 
        copiesArray.append(copy)
    }
}

