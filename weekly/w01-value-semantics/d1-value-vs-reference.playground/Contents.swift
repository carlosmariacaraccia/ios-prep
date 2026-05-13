import Foundation

struct PointStruct {
    var x: Int
    var y: Int
}

final class PointClass: CustomStringConvertible {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    var description: String {
        "PointClass( x: \(x), y: \(y))"
    }
}

var a = PointStruct(x: 1, y: 2)
var b = a
b.x = 99

print("struct -a:", a, "b: ", b)

let c = PointClass(x: 1, y: 2)
let d = c
c.x = 99

print("class -c:", c, "d: ", d)

let mutation = PointClass(x: 1, y: 2)
mutation.x = 99
print("after mutation:", mutation.x)

// mutation = PointClass(x: 1, y: 2) -> We cannot do this we cannot reassing because it is a let (constant)
