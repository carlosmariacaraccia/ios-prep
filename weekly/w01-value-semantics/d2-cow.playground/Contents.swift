import Foundation

// A ref type Buffer that holds the actual storage
final class Buffer<T> {
    var items: [T]
    
    init(items: [T]) {
        self.items = items
    }
    
    func copy() -> Buffer<T> {
        Buffer(items: items)
    }
}

// A value type wrapping the buffer with COW semantics
struct COWArray<T> {
    private var buffer: Buffer<T>
    
    init(_ array: [T]) {
        self.buffer = Buffer(items: array)
    }
    
    // Read Access is free - no copies neede
    var items:[T] {
        buffer.items
    }
    
    mutating func append(_ item: T) {
        if !isKnownUniquelyReferenced(&buffer) {
            print("buffer was shared - copying")
            buffer = buffer.copy()
        } else {
            print("buffer was unitque - mutating in place")
        }
        buffer.items.append(item)
    }
    
    // Subscript
    subscript(index: Int) -> T {
        get {
            buffer.items[index]
        }
        
        set {
            if !isKnownUniquelyReferenced(&buffer) {
                buffer = buffer.copy()
            }
            buffer.items[index] = newValue
        }
    }
}


var a = COWArray(Array(1...3))
a.append(4) // unique - mutates in place
var b = a   // now shared
b.append(5) // shared - copies first, then mutates
a.append(6) // a's buffer is unique again - mutates in place

print("a: ", a.items)
print("b: ", b.items)

var x = Array(1...3)
var y = x

x.withUnsafeBufferPointer({ print("x buffer:", $0.baseAddress!) })
y.withUnsafeBufferPointer({ print("y buffer:", $0.baseAddress!) })

y.append(4)

x.withUnsafeBufferPointer({ print("x buffer after y mutation:", $0.baseAddress!) })
y.withUnsafeBufferPointer({ print("y buffer after y mutation:", $0.baseAddress!) })


