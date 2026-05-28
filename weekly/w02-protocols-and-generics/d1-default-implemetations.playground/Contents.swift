import Foundation

protocol Drawable {
    var area: Double { get }
//    func describe() -> String
}

extension Drawable {
    func describe() -> String {
        "A \(type(of: self)) with area \(String(format: "%.2f", area))"
    }
}

struct Circle: Drawable {
    private let radius: Double
    var area: Double {
        Double.pi * radius * radius
    }
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func describe() -> String {
        "I am a Circle"
    }
    
}

struct Rectangle: Drawable {
    private let base: Double
    private let height: Double
    
    var area: Double {
        base * height
    }
    
    init(base: Double, height: Double) {
        self.base = base
        self.height = height
    }
    
}

struct Triangle: Drawable {
    private let base: Double
    private let height: Double
    
    var area: Double {
        base * height / 2
    }
    
    init(base: Double, height: Double) {
        self.base = base
        self.height = height
    }
}

let shapes: [Drawable] = [Circle(radius: 5), Rectangle(base: 2, height: 2), Triangle(base: 2, height: 2)]
shapes.forEach { print($0.describe()) }

let c = Circle(radius: 5)
print(c.describe())
