import Foundation

final class MyIntBuffer { 
    var data: [Int]

    init(_ data: [Int]) {
        self.data = data
    }

    // whatever happens in here we return a new buffer with the same data
    func copy() -> MyIntBuffer {
        MyIntBuffer(data)
    }
} 

struct MyBigStructWithCow { 
    private var buffer: MyIntBuffer

    var data: [Int] {
        buffer.data
    }
   
    init(_ size: Int) {
        self.buffer = MyIntBuffer(Array(0..<size))
    }

    mutating func append(_ x: Int) { 
        if 
    }
}