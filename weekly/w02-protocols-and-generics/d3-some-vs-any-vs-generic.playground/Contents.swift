import Foundation

protocol Container {
    associatedtype Item
    var count: Int { get }
    mutating func append(_ item: Item)
    subscript(_ i: Int) -> Item? { get }
}

struct Stack<Element>: Container {
    private var items = [Element]()
    
    mutating func push(_ element: Element) {
        items.append(element)
    }
    
    mutating func pop() -> Element? {
        items.popLast()
    }
    
    // MARK: - Conainer Implementation
    var count: Int {
        items.count
    }
    
    mutating func append(_ element: Element) {
        push(element)
    }
    
    subscript(i: Int) -> Element? {
        guard items.count > 0 else {
            return nil
        }
        
        return items[i]
    }
    
}

struct Queue<Element> {
    private var elements = [Element]()
    
    // Cost with array move all the elements
    // one value to the right. O(n)
    mutating func enqueue(_ element: Element) {
        elements.insert(element, at: 0)
    }
    
    mutating func dequeue() -> Element? {
        elements.popLast()
    }
}

extension Queue: Container {
    
    var count: Int {
        elements.count
    }
    
    mutating func append(_ element: Element) {
        enqueue(element)
    }
    
    subscript(i: Int) -> Element? {
        guard elements.count > 0 else {
            return nil
        }
        
        // as this is a queue we have to reverse the list
        let position = elements.count - i - 1
        return elements[position]
    }
}


func makeSomeContainer() -> some Container {
    Stack<Int>()
}

func makeAnyContainer() -> any Container {
    Stack<Int>()
}


var c = makeAnyContainer()
c.count
var a  = c[0]
let sum = a! + 1
if a == 1 { }
